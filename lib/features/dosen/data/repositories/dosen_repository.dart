// import 'dart:convert';
// import 'package:coba/features/dosen/data/models/dosen_model.dart';
// import 'package:http/http.dart' as http;

// class DosenRepository {
//   static const String _baseUrl =
//       'https://jsonplaceholder.typicode.com/users';

//   /// Mendapatkan daftar dosen dari API menggunakan http
//   Future<List<DosenModel>> getDosenList() async {
//     final response = await http.get(
//       Uri.parse(_baseUrl),
//       headers: {'Accept': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       print('Data dosen berhasil dimuat: ${data.length} item'); // Debug
//       return data.map((json) => DosenModel.fromJson(json)).toList();
//     } else {
//       print('Error: ${response.statusCode} - ${response.body}');
//       throw Exception('Gagal memuat data dosen: ${response.statusCode}');
//     }
//   }
// }

// use DIO 
import 'package:coba/features/dosen/data/models/dosen_model.dart';
import 'package:dio/dio.dart';

class DosenRepository {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/users';

  // Buat instance Dio dengan konfigurasi
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:        'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept':       'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  /// Mendapatkan daftar dosen dari API menggunakan Dio
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get('/users');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('Data dosen dimuat: ${data.length} item'); // Debug
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle error khusus dari Dio
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Koneksi timeout, periksa internet Anda');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('Tidak dapat terhubung ke server');
      } else {
        throw Exception('Error: ${e.message}');
      }
    }
  }
}
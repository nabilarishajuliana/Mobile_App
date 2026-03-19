// //USE HTTP
// import 'dart:convert';
// import 'package:coba/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
// import 'package:http/http.dart' as http;

// class MahasiswaAktifRepository {
//   static const String _baseUrl =
//       'https://jsonplaceholder.typicode.com/posts';

//   /// Mendapatkan daftar mahasiswa aktif dari API (http)
//   Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
//     final response = await http.get(
//       Uri.parse(_baseUrl),
//       headers: {'Accept': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(response.body);
//       // Batasi 20 item
//       final limited = data.take(20).toList();
//       return limited
//           .map((json) => MahasiswaAktifModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception(
//           'Gagal memuat data: ${response.statusCode}');
//     }
//   }
// }

// USE DIO
import 'package:coba/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:dio/dio.dart';

class MahasiswaAktifRepository {
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

  /// Mendapatkan daftar mahasiswa aktif dari API posts (Dio)
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Batasi 20 item
        final limited = data.take(20).toList();
        return limited
            .map((json) => MahasiswaAktifModel.fromJson(json))
            .toList();
      } else {
        throw Exception(
            'Gagal memuat data: ${response.statusCode}');
      }
    } on DioException catch (e) {
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
import 'package:coba/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Andi Pratama', nim: '2021001',
        email: 'andi.pratama@student.example.com',
        jurusan: 'Teknik Informatika', semester: '6', status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Budi Setiawan', nim: '2021002',
        email: 'budi.setiawan@student.example.com',
        jurusan: 'Teknik Informatika', semester: '4', status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Citra Dewi', nim: '2020001',
        email: 'citra.dewi@student.example.com',
        jurusan: 'Sistem Informasi', semester: '8', status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Dian Permata', nim: '2022001',
        email: 'dian.permata@student.example.com',
        jurusan: 'Teknik Informatika', semester: '2', status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Eko Saputra', nim: '2019001',
        email: 'eko.saputra@student.example.com',
        jurusan: 'Teknik Elektro', semester: '10', status: 'Lulus',
      ),
      MahasiswaModel(
        nama: 'Fajar Nugroho', nim: '2022002',
        email: 'fajar.nugroho@student.example.com',
        jurusan: 'Teknik Informatika', semester: '2', status: 'Aktif',
      ),
    ];
  }
}
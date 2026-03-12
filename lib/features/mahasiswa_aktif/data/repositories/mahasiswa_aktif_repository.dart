import 'package:coba/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Andi Pratama',  nim: '2021001',
        jurusan: 'Teknik Informatika', semester: '6',
        ipk: '3.75', angkatan: '2021',
      ),
      MahasiswaAktifModel(
        nama: 'Budi Setiawan', nim: '2021002',
        jurusan: 'Teknik Informatika', semester: '4',
        ipk: '3.50', angkatan: '2021',
      ),
      MahasiswaAktifModel(
        nama: 'Citra Dewi',    nim: '2020001',
        jurusan: 'Sistem Informasi',   semester: '8',
        ipk: '3.90', angkatan: '2020',
      ),
      MahasiswaAktifModel(
        nama: 'Dian Permata',  nim: '2022001',
        jurusan: 'Teknik Informatika', semester: '2',
        ipk: '3.60', angkatan: '2022',
      ),
      MahasiswaAktifModel(
        nama: 'Fajar Nugroho', nim: '2022002',
        jurusan: 'Teknik Informatika', semester: '2',
        ipk: '3.45', angkatan: '2022',
      ),
    ];
  }
}
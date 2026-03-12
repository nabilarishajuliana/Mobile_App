class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String jurusan;
  final String semester;
  final String ipk;
  final String angkatan;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.semester,
    required this.ipk,
    required this.angkatan,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      nama:      json['nama']      ?? '',
      nim:       json['nim']       ?? '',
      jurusan:   json['jurusan']   ?? '',
      semester:  json['semester']  ?? '',
      ipk:       json['ipk']       ?? '0.00',
      angkatan:  json['angkatan']  ?? '',
    );
  }
}
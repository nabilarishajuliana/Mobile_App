import 'dart:io';

void main() {
  // Map<String, String> data = {
  //   'Anang': '081234567890',
  //   'Arman': '082345678901',
  //   'Doni': '083456789012',
  // };

  // print('Data: $data');

  // // tambah data
  // data['Rio'] = '084567890123';
  // print('Data habis ditambah: $data');
  // // nampilin data
  // print("nampilin data anang : ${data['Anang']}");
  // // ubah
  // data['Anang'] = '089999999999';
  // print("data anang stlh diubah : ${data['Anang']}");
  // // hapus
  // data.remove('Doni');
  // print('Data habis dihapus: $data');
  // // cek bedasarkan key
  // if (data.containsKey('Arman')) {
  //   print('Arman ada');
  // }
  // // nampilin key dan values
  // print("jumlah data ${data.length}");
  // print("data key: ${data.keys}");
  // print("data values: ${data.values}");

  // ---- Input Single Mahasiswa ----
  print('\n=== INPUT DATA MAHASISWA ===');
  Map<String, dynamic> mahasiswa = {};

  stdout.write('Masukkan NIM: ');
  mahasiswa['nim'] = stdin.readLineSync()!;

  stdout.write('Masukkan Nama: ');
  mahasiswa['nama'] = stdin.readLineSync()!;

  stdout.write('Masukkan Jurusan: ');
  mahasiswa['jurusan'] = stdin.readLineSync()!;

  stdout.write('Masukkan IPK: ');
  mahasiswa['ipk'] = stdin.readLineSync()!;

  print('Data Mahasiswa: $mahasiswa');

  // ---- Input Multiple Mahasiswa ----
  print('\n=== INPUT MULTIPLE MAHASISWA ===');
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  List<Map<String, dynamic>> listMahasiswa = [];

  for (int i = 0; i < jumlah; i++) {
    print('\n---- Mahasiswa ke-${i + 1} ----');
    Map<String, dynamic> mhs = {};

    stdout.write('Masukkan NIM: ');
    mhs['nim'] = stdin.readLineSync()!;

    stdout.write('Masukkan Nama: ');
    mhs['nama'] = stdin.readLineSync()!;

    stdout.write('Masukkan Jurusan: ');
    mhs['jurusan'] = stdin.readLineSync()!;

    stdout.write('Masukkan IPK: ');
    mhs['ipk'] = stdin.readLineSync()!;

    listMahasiswa.add(mhs);
  }

  print('\n=== DATA SEMUA MAHASISWA ===');
  for (var m in listMahasiswa) {
    print(m);
  }

}

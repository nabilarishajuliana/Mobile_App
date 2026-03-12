import 'dart:io';

void main() {
  // // list
  // List<String> names = ['Alfa', 'Beta', 'Charlie'];
  // print('Names: $names');

  // // nambah list
  // names.add('Delta');
  // print('Names setelah ditambahkan: $names');

  // //nampilin elemen
  // print('Elemen pertama: ${names[0]}');
  // print('Elemen kedua: ${names[1]}');

  // //ganti elemen
  // names[1] = 'Bravo';
  // print('Names setelah diubah: $names');

  // // hapus data list
  // names.remove('Charlie');
  // print('Names setelah dihapus: $names');

  // // nampilin panjang data
  // print('Jumlah data: ${names.length}');

  // // loop
  // print('Semua data:');
  // for (String name in names) {
  //   print(name);
  // }

  List<String> dataList = [];
  print('data kosong: $dataList');

// buat masukin jumlah array
  int count = 0;
  while (count <= 0) {
    stdout.write("masukkan jumlah list:");
    String? input = stdin.readLineSync();

    try {
      count = int.parse(input!);
      if (count <= 0) {
        print("masukkan angka lebih dari 0");
      }
    } catch (e) {
      print("input ga valid");
    }
  }
// masukin jumlah array
  for (int i = 0; i < count; i++) {
    stdout.write("Data ke-${i + 1}: ");
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }

  // Tampil berdasarkan index
  stdout.write('\nMasukkan index yang ingin ditampilkan: ');
  int indexTampil = int.parse(stdin.readLineSync()!);
  if (indexTampil >= 0 && indexTampil < dataList.length) {
    print('Data index $indexTampil: ${dataList[indexTampil]}');
  } else {
    print('Index tidak valid!');
  }

  // Ubah berdasarkan index
  stdout.write('Masukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  if (indexUbah >= 0 && indexUbah < dataList.length) {
    dataList[indexUbah] = dataBaru;
    print('Data berhasil diubah!');
  }

  // Hapus berdasarkan index
  stdout.write('Masukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);
  if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
    print('Data berhasil dihapus!');
  }

  // Tampilkan hasil akhir
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }
}

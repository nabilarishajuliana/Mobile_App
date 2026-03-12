import 'dart:io';

void main() {
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  print('Burung: $burung');

  //tambah data
  stdout.write("masukkan data:");
  String input = stdin.readLineSync()!;
  burung.add(input);

  //tambah data duplicate
  stdout.write("masukkan data(kalau bisa duplicate):");
  String input2 = stdin.readLineSync()!;
  burung.add(input2);

  // hapus data
  stdout.write("masukkan data yg pengen dihapus:");
  String input3 = stdin.readLineSync()!;
  burung.remove(input3);

  //cek data
    stdout.write("masukkan data yg pengen dicek:");
    String input4 = stdin.readLineSync()!;
  if (burung.contains(input4)) {
    print('$input4 ada di Set');
  }

  //hitung total data
  print('Total data: ${burung.length}');
  print('Burung: $burung');
}

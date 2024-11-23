/*
Viet chuong trinh chuyen doi 1 so nguyen (n>=1) duoc nhap tu ban phim thanh so nhi phan
*/
import 'dart:io';

void main() {
  print('Nhập vào một số nguyên (n >= 1): ');
  int n = int.parse(stdin.readLineSync()!);

  // Chuyển đổi sang nhị phân
  String binary = n.toRadixString(2);

  print('Số nhị phân tương ứng là: $binary');
}
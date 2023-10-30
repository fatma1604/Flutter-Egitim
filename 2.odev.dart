import 'dart:io';
import 'dart:math'; // matematik işlemleri için gerekli kütüphane

bool armstrongSayisiMi(int number) {
  int temporaryNumber = number;
  int step = number.toString().length;
  int total = 0;

  while (temporaryNumber > 0) {
    int rakam = temporaryNumber % 10;
    total += pow(rakam, step).toInt();
    temporaryNumber ~/= 10;
  }

  return number == total;
}

void main() {
  stdout.write(
      'Armstrong sayisi olup olmadiğini kontrol etmek istediğiniz sayiyi girin: ');
  int number = int.parse(stdin.readLineSync()!);

  if (armstrongSayisiMi(number)) {
    print('$number bir Armstrong sayisidir.');
  } else {
    print('$number bir Armstrong sayisi değildir.');
  }
}

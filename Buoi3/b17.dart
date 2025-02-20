import 'dart:math';
import 'dart:io';

void main() {
  //ax2 + bx + c = 0
  double a = 0, b = 0, c = 0;

  do {
    stdout.write("Nhap he so a (a != 0)");
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0;
    }
  } while (a == 0);
  stdout.write("Nhap he so b ");
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }
  stdout.write("Nhap he so c ");
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  double delta = b * b - 4 * a * c;

  print('phuont trinh: ${a}x^2 + ${b}x + ${c} = 0');

  if (delta < 0) {
    print("Phuong trinh vo nghiem");
  } else if (delta == 0) {
    double x = (-b) / (2 * a);
    print(x.toStringAsFixed(2));
  } else {
    double x1 = (-b - (sqrt(delta))) / 2 * a;
    double x2 = (-b + (sqrt(delta))) / 2 * a;

    print(
      "x1: ${x1.toStringAsFixed(2)}\n"
      "x2: ${x2.toStringAsFixed(2)}",
    );
  }
}

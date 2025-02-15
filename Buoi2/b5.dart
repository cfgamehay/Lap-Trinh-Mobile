//Final vs Const

void main() {
  // Final
  final String name = 'Tung'; //da gán nên khong the thay doi

  // chưa gán nên có thể gán
  late final int age;
  age = 12;
  // khong the gan
  // age = 13;

  // Const bắt buộc phải có giá trị khi khai báo
  const String color = 'red';
  // khong the khoi tao
  // const String material;
}

void main() {
  var s1 = 'Binh';
  var s2 = "Binh";

  // using variable inside string
  double diemToan = 8.5;
  double diemVan = 7.5;
  var s3 = 'Xin chao ${s1}, Tong diem cua ban la ${(diemVan + diemToan) / 2}';

  //

  var s4 = '''
Dong 1
DOng 2
Dong 3
  ''';

  var s5 = """"
Dong 1
dong 2
dong 3
""";

  var s6 = 'Hello \nWorld';

  var s7 = r'Hello \nWorld'; // raw

  var s8 = "chuói1" + 'choi 2';

  var s9 =
      'str1'
      'str2'
      'str3';
}

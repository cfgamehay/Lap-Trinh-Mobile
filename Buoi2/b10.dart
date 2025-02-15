void main() {
  var a = 2;

  print(a);

  // ??= : nếu biến null thì sẽ gán còn không thì không gán

  int? b;
  b ??= 5;

  print("b = ${b}");
  
}

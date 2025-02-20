void main() {
  var kiemTra = (100 % 2 == 0) ? "So chan" : "So le";

  print(kiemTra);

  var x = 100;
  var y = x ?? 50;
  print(y);

  int? z;

  y = z ?? 30;

  print(y);
}
  /*
    (a < b) ? a: b 

    a ?? b (nếu a null thì b dc trả về)
  */
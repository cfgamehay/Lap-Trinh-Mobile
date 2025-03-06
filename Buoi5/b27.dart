double sum(double a, var b, var c) {
  return a + b + c;
}

double tinhTong1(double a, double b, var c) => a + b + c;

String createFullname({name, age}) {
  return '${name}, ${age}';
}

double sum2(double a, [double? b, double? c, double? d]) {
  var result = 0.0;
  result += (b != null) ? b : 0;
  result += (c != null) ? c : 0;
  result += (d != null) ? d : 0;
  return result;
}

void main(List<String> args) {
  var x = sum(1, 2, 3);
  var y = tinhTong1(1, 2, 3);
  var z = createFullname(name: "Binh");

  print(z);
  print(sum2(x));

  (int a, int b) {
    print(a + b);
  }(10, 20);

  var getSum = ((int a, int b) => a + b)(10, 20);

  print(getSum);

  var sum3 = (int a, int b) => a + b;
}

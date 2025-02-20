void main() {
  //so nguyen
  int x = 100;

  //so thuc
  double y = 100.0;

  //co the la so nguyen co the la so thuc
  num z = 100;
  num t = 10.75;

  // chuyen string qua int

  var one = int.parse("1");

  print((one == 1 ? "True" : "False"));

  var onePointOnt = double.parse('1.1');

  print((onePointOnt == 1.1 ? "True" : "False"));

  //number to string

  String oneAsString = 1.toString();

  //double to string
  String piAsString = 3.14159.toStringAsFixed(2);
}

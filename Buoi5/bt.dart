typedef soNguyen = int;
typedef soThuc = double;
typedef chuoi = String;
typedef boolean = bool;

void main(List<String> args) {
  soNguyen a = 1;
  soNguyen a1 = 2;
  soThuc b = 1.1;
  chuoi c = 'Hello';
  boolean d = false;

  var record = (a, b, c, d, name: "Binh");

  print(
    '${record.$1}, ${record.$2}, ${record.$3}, ${record.$4}, ${record.name}',
  );

  print(calculateSum(a, a1));
}

int calculateSum(int a, int b) {
  return a + b;
}

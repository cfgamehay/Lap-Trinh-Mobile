void main(List<String> args) {
  // Runes sử lý  chuỗi (1 dãy kí tự unicode)

  String str = 'Hello';
  Runes runes1 = str.runes;

  Runes runes2 = Runes('\u2665');

  Runes runes3 = Runes('\u{1F600}');

  print(String.fromCharCode(128512));
}

void main() {
  Object obj = 'Hello';
  // kiểm tra cùng kiểu
  if (obj is String) {
    print("Obj is a string");
  }
  // kiểm tra khác kiểu
  if (obj is! int) {
    print("obj is not a int");
  }

  //ep kieu (as datatype)

  String str = obj as String;
  print(str.toLowerCase());
}

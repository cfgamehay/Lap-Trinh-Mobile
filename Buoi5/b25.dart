void main(List<String> args) {
  var test = ('first', a: 2, 5, {2, 3});

  var point = (123, 456);

  var person = (name: "Binh", age: 12, 5);

  //dùng trị số
  print('${point.$1}, ${point.$2}');
  print('${person.$1}');

  //dùng key
  print('${person.name}, ${person.age}');
}

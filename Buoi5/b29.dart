void main(List<String> args) {
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  var names = ["binh", "tuan", "thanh"];

  for (var name in names) {
    print(name);
  }

  names.forEach(test);
}

void test(String s) {
  print(s + "nè");
}

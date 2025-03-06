//mixin

mixin M {
  int? a;
  void showSomeThing() {
    print("some thing ...");
  }
}

class B {
  String name = 'class b';

  void displayInfomation() {
    print("info from B");
  }
}

class C extends B with M {
  @override
  void displayInfomation() {
    showSomeThing();
    a = 100;
  }
}

void main(List<String> args) {
  var c = C();

  c.displayInfomation();
}

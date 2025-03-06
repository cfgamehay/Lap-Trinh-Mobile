//class
import 'dart:ffi';
import 'dart:math';

class Point {
  //field
  double x, y;
  // double _z;
  //constructor
  Point(this.x, this.y);
  double distanceTo(Point other) {
    var dx = x - other.y;
    var dy = y - other.x;
    return sqrt(dx * dx + dy * dy);
  }
}

class Point2 {
  double? x; // null
  double z = 0; // 0
}

//getter setter
class Rect {
  double left, top, width, height;

  late double _z;

  Rect(this.left, this.top, this.width, this.height);

  double get z => _z;
  set z(double value) => _z = value;

  @override
  String toString() {
    return '${this.left} ${this.top} ${this.width} ${this.height}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return super == other;
  }
}
//static method

class myMath {
  static const double PI = 3.14159;
  static double square(double a) {
    return a * a;
  }
}

void main(List<String> args) {
  Point p1 = new Point(1, 2);
  Point p2 = new Point(3, 4);

  print(p1.distanceTo(p2).toStringAsFixed(2));

  Rect r1 = new Rect(0, 0, 4, 5);

  print(r1);
}

//hashSet
//set chỉ chưa các phần tử không trùng
void main(List<String> args) {
  Set<int> a = {1, 2, 3};
  var b = <int>{1, 2, 3};
  Set<int> c = Set();

  //tao set moi
  var newSet = Set.from(a);

  //
  newSet.where((e) => e > 2); // tim nhung phan tu có diều kien
  newSet.map((e) => e += 2); // thao tac voi toan vo set

  //add to set
  newSet.add(1); //add value

  //chứa gần như toàn bộ các phương thức mà list có
}

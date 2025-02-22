//Cau truc du lieu

import 'dart:developer';

void main(List<String> args) {
  //List (array)

  List<String> list1 = [];

  var list2 = [1, 2, 3];

  List<String> list3 = ['A', 'B', 'C'];

  var list4 = List<int>.filled(3, 0); //3 phan tu có giá trị 0

  //add
  list3.add("1");
  list3.addAll(["3", "2"]);
  //insert

  list3.insert(0, "1"); // (index, value)
  list3.insertAll(0, ['2', '3']); // (index, [values])

  //remove

  list3.remove("A"); // (value)
  list3.removeAt(0); // (index)
  list3.removeLast(); // pop()
  list3.removeWhere((e) => e == 'B'); //
  list3.clear();

  //get element
  print(list2[0]); // get element at index 0
  print(list2.first); // get first element
  print(list2.last); // get last element
  print(list2.length); //get length

  //checking

  print(list2.isEmpty); // check if list is empty
  print(
    (list3.isNotEmpty) ? "this list is not empty" : "this list is empty",
  ); // check if is not empty
  print(list4.contains(0)); // check if contain
  print(list4.indexOf(0)); //return first index of the value
  print(list4.lastIndexOf(0)); //return last index of the value

  list4 = [2, 10, 4, 2, 5];

  list4.sort();
  list4.sort((a, b) => b.compareTo(a)); // sort nếu b > a

  print(list4);
  list4 = list4.reversed.toList();

  print(list4);
  //slice list

  var sublist = list4.sublist(0, 2); // (start, end) return sublist
  var str = sublist.join(","); // ngăn cách bằng ","
  list4.forEach((e) {
    print(e);
  });

  print(str);
}

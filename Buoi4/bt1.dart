void main(List<String> args) {
  List list1 = ['A', 'B', 'C', 'B'];
  //Thêm phần tử 'D' vào cuối List
  list1.add('D');
  //Chèn phần tử 'X' vào vị trí thứ 1
  list1.insert(1, 'X');
  //Xóa phần tử 'B'
  list1.remove('B');
  //In ra độ dài của List
  print(list1.length);
  //dartCopyvar list = [1, 2, 3, 4, 5];
  //list.removeWhere((e) => e % 2 == 0);
  //print(list);
  //res: [1,3,5] => nếu e chia hết cho 2 thì sẽ xóa phần tử đó

  //Giải thích sự khác nhau giữa các phương thức:
  //remove() và removeAt()
  /*
    remove(value) => xóa phần tử đầu tiên có giá trị = value

    removeAt(index) => xóa phần tử có chỉ mục bằng index
   */

  //add() và insert()
  /*
    add(value) => thêm phần tử có giá trị value vào cuối mảng

    insert(index, value) => thêm phần tử có giá trị value vào vị trí thứ index vào mảng
   */
  //addAll() và insertAll()
  /*
    addAll([values]) => thêm mảng các phần tử có giá trị value vào cuối mảng

    insertAll(index, [values]) => thêm mảng các  phần tử có giá trị value vào vị trí thứ index vào mảng
   */
  /*



   */
}

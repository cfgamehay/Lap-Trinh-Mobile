void main(List<String> args) {
  // Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
  /**
   * các phần tử trong set không có thứ tự sắp xếp
   * các phần tử trong set là độc nhất
   * khai báo trong set dùng {} thay vì [] như trong list
   */

  Set<int> set1 = {1, 2, 3};
  var set2 = {3, 4, 5};
  // Union (hợp)
  // res: [1,2,3,4,5] => chứa tất cả các phần tử của cả 2 set => không trùng
  // Intersection (giao)
  // res: [3] => cả hai cùng có
  // Difference (hiệu) của set1 với set2
  // res: [1,2] => 1 có 2 không có

  // Đoạn code sau sẽ cho kết quả gì?

  // dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
  // print(mySet.length);
  //res => [1,2,3,4]
}

// Bài 2: Set

// Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
// Cho hai Set:

// dartCopyvar set1 = {1, 2, 3};
// var set2 = {3, 4, 5};
// Tính kết quả của:

// Union (hợp)
// Intersection (giao)
// Difference (hiệu) của set1 với set2


// Đoạn code sau sẽ cho kết quả gì?

// dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
// print(mySet.length);
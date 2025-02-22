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
  print(set1.union(set2));
  print(set1.intersection(set2));
  print(set1.difference(set2));
  print(set2.difference(set1));
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
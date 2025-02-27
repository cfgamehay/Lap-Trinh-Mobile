void main(List<String> args) {
  // Viết code để thực hiện các yêu cầu sau với Map:

  // dartCopyMap<String, dynamic> user = {
  //   'name': 'Nam',
  //   'age': 20,
  //   'isStudent': true
  // };

  Map<String, dynamic> user = {'name': 'Nam', 'age': 20, 'isStudent': true};
  user['Email'] = 'nam@gmail.com';
  user['age'] = 21;
  user.remove('isStudent');
  bool containtPhone = user.keys.contains('phone');

  print(user);
  print(containtPhone);

  user.forEach((key, value) {
    print('key: ${key}, value: ${value}');
  });

  // dartCopyuser['phone']
  // không null thì trả về giá trị null thì trả về lỗi
  // user['phone'] ?? 'Không có số điện thoại'
  // không null thì trả về giá trị null thì trả về 'Không có số điện thoại'
}

// Bài 3: Map

// Viết code để thực hiện các yêu cầu sau với Map:

// dartCopyMap<String, dynamic> user = {
//   'name': 'Nam',
//   'age': 20,
//   'isStudent': true
// };

// Thêm email: 'nam@gmail.com'
// Cập nhật age thành 21
// Xóa trường isStudent
// Kiểm tra xem Map có chứa key 'phone' không


// So sánh hai cách truy cập giá trị trong Map:



// Viết một hàm nhận vào một Map và in ra tất cả các cặp key-value, mỗi cặp trên một dòng.
void main(List<String> args) {
  //Map contains key value pair

  Map<String, dynamic> user = {'name': 'name'};

  var user2 = <String, dynamic>{};

  //add value to map or update
  user['new'] = '';
  user['name'] = 'new name';
  user.putIfAbsent('phone', () => '0123456789');
  user.addAll({'newName': '', 'newAge': 5});

  // truy cap
  user['name'];
  user.length;
  // truy cap an toan
  var name = user['key'] ?? "undefind";

  //duyet

  user.forEach((key, value) {
    print(key);
    print(value);
  });
}

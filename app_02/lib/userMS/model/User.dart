import "dart:convert";

class User{
  //feild
  int? id;
  String name;
  String email;
  String phone;
  String? avatar;
  DateTime dateOfBirth;
  //contructor
  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    required this.dateOfBirth,
  });

  //tool map
    //tao map từ đối tượng
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  String toJSON() {
    return jsonEncode({
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    });

  }

    //tạo đối tượng từ map (db trả về map)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      avatar: map['avatar'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }

  factory User.fromJSON(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return User(
      id: jsonMap['id'],
      name: jsonMap['name'],
      email: jsonMap['email'],
      phone: jsonMap['phone'],
      avatar: jsonMap['avatar'],
      dateOfBirth: DateTime.parse(jsonMap['dateOfBirth']),
    );

  }
  //sửa thuộc tính nếu giá trị đó null


  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, dateOfBirth: $dateOfBirth)';
  }

}
import 'dart:convert';

class Note{
  int? id;
  String title;
  String content;
  int priority;
  DateTime createdAt;
  DateTime modifiedAt;
  List<String> tags;
  String? color;
  //contructor
  Note({
    this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.createdAt,
    required this.modifiedAt,
    required this.tags,
    this.color,
  });

  //tool map
  //tao map từ đối tượng
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags.join(','),
      'color': color,
    };
  }
  //tạo đối tượng từ map (db trả về map)
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      priority: map['priority'],
      createdAt: DateTime.parse(map['createdAt']),
      modifiedAt: DateTime.parse(map['modifiedAt']),
      tags: List<String>.from(map['tags']), // Correctly converting the list
      color: map['color'],
    );
  }

  //sửa thuộc tính nếu giá trị đó null

  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? priority,
    DateTime? createdAt,
    DateTime? modifiedAt,
    List<String>? tags,
    String? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      tags: tags ?? this.tags,
      color: color ?? this.color,
    );
  }

  String toJSON() {
    return jsonEncode({
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'tags': tags.join(','),
      'color': color,
    });

  }


  factory Note.fromJSON(String jsonString) {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Note(
      id: jsonMap['id'],
      title: jsonMap['title'],
      content: jsonMap['content'],
      priority: jsonMap['priority'],
      createdAt: DateTime.parse(jsonMap['createdAt']),
      modifiedAt: DateTime.parse(jsonMap['modifiedAt']),
      tags: jsonMap['tags'].split(','),
      color: jsonMap['color'],
    );

  }

  @override
  String toString() {
    return 'User(id: $id, title: $title, content: $content, priority: $priority, createdAt: $createdAt, modifiedAt: $modifiedAt, tags: $tags)';
  }

}
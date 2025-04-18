// import "../db/UserDatabaseHelper.dart";
// import "package:app_02/userMS/model/User.dart";
// import "package:app_02/userMS/view/UserListItem.dart";
// import 'package:app_02/userMS/view/AddUserScreen.dart';
// import 'package:app_02/userMS/view/EditUserScreen.dart';

import 'package:flutter/material.dart';
import 'package:app_02/NoteApp/db/NodeDatabaseHelper.dart';
import 'package:app_02/NoteApp/model/Note.dart';
import 'package:app_02/NoteApp/view/NoteListItem.dart';
import 'package:app_02/NoteApp/view/AddNoteScreen.dart';
import 'package:app_02/NoteApp/view/EditNoteScreen.dart';
import 'package:app_02/NoteApp/api/NoteApiService.dart';
import '../view/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NoteListScreen extends StatefulWidget {
  final Function? onLogout;

  NoteListScreen({this.onLogout});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Future<List<String>> _tagsFuture;
  late Future<List<Note>> _notesFuture;
  String? _selectedTag;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    setState(() {
      // _tagsFuture = NoteDatabaseHelper.instance.getAllTags(); // Fetch tags
      // _notesFuture = NoteDatabaseHelper.instance.getAllNotes(_selectedTag ?? '' );
      _tagsFuture = NoteAPIService.instance.getAllTags();
      _notesFuture = NoteAPIService.instance.getAllNotes();
    });
// Fetch notes
  }

  void _filterNotesByTag(String tag) {
    setState(() {
      _selectedTag = tag;
      // _notesFuture = NoteDatabaseHelper.instance.getAllNotes(tag); // Filter notes by tag
      _notesFuture = NoteAPIService.instance.getNotesByTag(tag);
    });
  }

  void _searchNotes(String query) {
    setState(() {
      // _notesFuture = NoteDatabaseHelper.instance.searchNotes(query); // Search notes
      _notesFuture = NoteAPIService.instance.getAllNotes(query: query);
    });
  }

  // Thêm phương thức xử lý đăng xuất trực tiếp trong class này
  Future<void> _handleLogout() async {
    // Xóa dữ liệu người dùng
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Kiểm tra xem widget có còn được gắn kết không
    if (!mounted) return;

    // Điều hướng trở lại màn hình đăng nhập và xóa tất cả các màn hình trước đó
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes with Tags'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
          // Thêm menu tùy chọn
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog();
              }
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Đăng xuất'),
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
      body: Column(
        children: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                onChanged: (_) {
                  _searchNotes(controller.text);
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(0, (int index) {
                final String item = '';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
          // Tags Section
          FutureBuilder<List<String>>(
            future: _tagsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return Center(child: Text('Chưa có tag nào!'));
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 3,
                    children: snapshot.data!.map((tag) {
                      return ChoiceChip(
                          label: Text(tag),
                          selected: _selectedTag == tag,
                          onSelected: (selected) {
                            if (selected) {
                              _filterNotesByTag(tag);
                            }
                            else {
                              _filterNotesByTag('');
                            }
                          }
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),

          // Notes Section
          Expanded(
            child: FutureBuilder<List<Note>>(
              future: _notesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || !snapshot.hasData ||
                    snapshot.data!.isEmpty) {
                  return Center(child: Text('Chưa có note nào'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final note = snapshot.data![index];
                      return NoteListItem(
                        note: note,
                        onDelete: () async {
                          // await NoteAPIService.instance.deleteNote(note.id!);
                          await NoteDatabaseHelper.instance.deleteNote(
                              note.id!);
                          _refreshData();
                        },
                        onEdit: () async {
                          final updated = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoteScreen(note: note),
                            ),
                          );
                          if (updated == true) {
                            _refreshData();
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () async {
          final created = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNoteScreen(),),);
          if (created == true) {
            _refreshData();
          }
        },
        )
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Xác nhận đăng xuất'),
        content: Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              // Ưu tiên sử dụng hàm xử lý đăng xuất trong class này
              // Nếu widget.onLogout được cung cấp, gọi nó sau khi xử lý đăng xuất
              _handleLogout().then((_) {
                if (widget.onLogout != null) {
                  widget.onLogout!();
                }
              });
            },
            child: Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:app_02/NoteApp/api/NoteApiService.dart';
import 'package:app_02/NoteApp/db/NodeDatabaseHelper.dart';
import 'package:app_02/NoteApp/model/Note.dart';
import 'package:app_02/NoteApp/view/NoteForm.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      onSave: (Note note) async {
        try {
          //create note here
          // await NoteAPIService.instance.createNote(note);
          await NoteDatabaseHelper.instance.createNote(note);
          Navigator.pop(context, true);

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thêm ghi chú thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi thêm ghi chú: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}
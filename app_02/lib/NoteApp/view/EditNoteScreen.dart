import 'package:flutter/material.dart';
import 'package:app_02/NoteApp/db/NodeDatabaseHelper.dart';
import 'package:app_02/NoteApp/model/Note.dart';
import 'package:app_02/NoteApp/view/NoteForm.dart';

import 'package:app_02/NoteApp/api/NoteApiService.dart';

class EditNoteScreen extends StatelessWidget {
  final Note note;

  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      note: note,
      onSave: (Note updatedNote) async {
        try {
          // await NoteAPIService.instance.updateNote(updatedNote);
          await NoteDatabaseHelper.instance.updateNote(updatedNote);
          Navigator.pop(context, true); // Return true to indicate the user was updated

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cập ghi chú thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi ghi chú dùng: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}
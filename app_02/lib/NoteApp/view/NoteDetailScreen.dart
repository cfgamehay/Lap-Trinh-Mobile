import "dart:io";
import "package:app_02/NoteApp/model/Note.dart";
import "package:app_02/NoteApp/view/NoteListScreen.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:hexcolor/hexcolor.dart";
import 'package:app_02/NoteApp/view/EditNoteScreen.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (note.color != null) {
      backgroundColor = HexColor(note.color!);
    }

    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ngày tạo: ${DateFormat('dd/MM/yyyy').format(note.createdAt)} - Ngày sửa: ${DateFormat('dd/MM/yyyy').format(note.modifiedAt)}',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                note.content,
                style: TextStyle(fontSize: 16),
              ),
            ]
          )
      ),
    );
  }
}
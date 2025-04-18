import 'dart:io';
import 'package:app_02/NoteApp/api/NoteApiService.dart';
import 'package:flutter/material.dart';
import 'package:app_02/NoteApp/model/Note.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_02/NoteApp/db/NodeDatabaseHelper.dart';

// Widget UserForm là StatefulWidget
class NoteForm extends StatefulWidget {
  //Đối tượng user
  final Note? note;
  final Function(Note note) onSave;

  const NoteForm({Key? key, this.note, required this.onSave}) : super(key: key);

  // Tạo State cho UserForm
  @override
  _NoteFormState createState() => _NoteFormState();
}

// State cho Note
class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _noteContentController = TextEditingController();
  final _titleController = TextEditingController();
  final _priorityController = TextEditingController();
  final _tagsController = TextEditingController();
  DateTime currentDate = DateTime.now();
  Color pickerColor = Color(0xffffff);
  late Future<List<String>> _tagsFuture;

  void onColorChanged(Color color) {
    setState(() => pickerColor = color);
  }

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _tagsFuture = NoteDatabaseHelper.instance.getAllTags();
    _tagsFuture = NoteAPIService.instance.getAllTags();
    if (widget.note != null) {
      _noteContentController.text = widget.note!.content;
      _titleController.text = widget.note!.title;
      _priorityController.text = widget.note!.priority.toString();
      _tagsController.text = widget.note!.tags.join(',');
      currentDate = widget.note!.createdAt;
      if (widget.note!.color != null) {
        pickerColor = HexColor(widget.note!.color!);
      }
    }
  }

  @override
  void dispose() {
    _noteContentController.dispose();
    _titleController.dispose();
    _priorityController.dispose();
    super.dispose();
  }

  Future<void> _pickColor() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn màu'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: onColorChanged,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Xác nhận'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final Note note = Note(
        id: widget.note?.id,
        title: _titleController.text,
        content: _noteContentController.text,
        priority: int.parse(_priorityController.text),
        createdAt: currentDate,
        modifiedAt: DateTime.now(),
        tags: _tagsController.text.trim().length > 0 ? _tagsController.text.split(',') : ["No tags"],
        color:
        '#${pickerColor.value.toRadixString(16).padLeft(8, '0')
            .substring(2)
            .toUpperCase()}',
      );

      //UserForm.onSave(user)
      widget.onSave(note);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Sửa ghi chú' : 'Thêm mới ghi chú'),
        backgroundColor: pickerColor,
        actions: [
          IconButton(icon: Icon(Icons.color_lens), onPressed: _pickColor),
        ],
      ),
      body:
      _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Độ ưu tiên (Càng lớn càng ưu tiên)',
                    border: OutlineInputBorder(),
                  ),
                  value: _priorityController.text.isEmpty ? 1 : int.parse(_priorityController.text),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text('1'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('2'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('3'),
                    )
                  ],
                  onChanged: (change){
                      _priorityController.text = change.toString();
                  },
                validator: (value) {
                    if(_priorityController.text.isEmpty) {
                      return 'Vui lòng chọn độ ưu tiên';
                    }
                }
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _tagsController,
                decoration: InputDecoration(
                  labelText: 'Tags (yêu thích, học tập,...)',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              FutureBuilder(
                future: _tagsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Text('Không tìm thấy tags.');
                  } else {
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Tags',
                        border: OutlineInputBorder(),
                      ),
                      items: snapshot.data!.map((tag) {
                        return DropdownMenuItem(
                          value: tag,
                          child: Text(tag),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          if (_tagsController.text != "") {
                            if (_tagsController.text.toLowerCase().contains(
                                value.toString().toLowerCase())) {
                              _tagsController.text = _tagsController.text.replaceAll(value.toString(), "");
                              _tagsController.text.replaceAll(",,",",");
                              if(_tagsController.text.startsWith(",")) {
                                _tagsController.text = _tagsController.text.substring(1);
                              }

                            }
                            else {
                              _tagsController.text = "${_tagsController.text},$value";
                            }
                          }
                          else {
                            _tagsController.text = value.toString();
                          }
                        });
                      },
                    );
                  }
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                controller: _noteContentController,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(),
                ),
                maxLines: 15,
              ),

              SizedBox(height: 16),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    isEditing ? 'CẬP NHẬT' : 'THÊM MỚI',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

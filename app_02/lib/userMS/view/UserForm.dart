import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:app_02/userMS/model/User.dart';


// Widget UserForm là StatefulWidget
class UserForm extends StatefulWidget {
  //Đối tượng user
  final User? user;
  final Function(User user) onSave;

  const UserForm(
      {
        Key? key,
        this.user,
        required this.onSave
      }) : super(key: key);

  // Tạo State cho UserForm
  @override
  _UserFormState createState() => _UserFormState();
}

// State cho UserForm
class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  DateTime _birthDay = DateTime.now().subtract(Duration(days: 365 * 18));
  String? _avatarPath;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _emailController.text = widget.user!.email;
      _phoneController.text = widget.user!.phone;
      _birthDay = widget.user!.dateOfBirth;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try{
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if(image != null){
        setState(() {
          _avatarPath = image.path;
        });
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi chọn ảnh: $e')),
      );
    }
  }

  Future<void> _selectDate (BuildContext context) async
  {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDay,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if(picked != null && picked != _birthDay){
      setState(() {
        _birthDay = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });

      final User user = User(
        id: widget.user?.id,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        avatar: _avatarPath,
        dateOfBirth: _birthDay,
      );

      //UserForm.onSave(user)
      widget.onSave(user);

    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Sửa thông tin người dùng' : 'Thêm mới người dùng')
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue.shade100,
                      backgroundImage: _avatarPath != null
                          ? FileImage(File(_avatarPath!))
                          : null,
                      child: _avatarPath == null
                          ? Icon(Icons.person, size: 60, color: Colors.white)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ và tên';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Date of birth field
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Ngày sinh',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: DateFormat('dd/MM/yyyy').format(_birthDay),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng chọn ngày sinh';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    isEditing ? 'CẬP NHẬT' : 'THÊM MỚI',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ]
          )
        )
      ),

    );
  }
}
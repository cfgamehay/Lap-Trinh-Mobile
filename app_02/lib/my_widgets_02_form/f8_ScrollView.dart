import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<ImagePickerForm>
{
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _phone;
  String? _city;
  String? _gender;
  bool? _isAgreed = false;
  DateTime? _birthDay;
  File? _image;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDayController = TextEditingController();
  bool _isPasswordVisible = false;
  final ImagePicker _picker = ImagePicker();

  final List<String> _cities = ["Hà Nội", "Hồ Chí Minh", "Đà Nẵng"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Form")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                  children: [
                    //Lien quan
                    //Validator
                    //Controller
                    //obscureText
                    //AutovalidateMode
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: "Họ và tên",
                        hintText: "Nhập họ và tên",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value){
                        _name = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {

                          return 'Vui lòng nhập tên người dùng';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0), // Bo tròn viền
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Ảnh đại diện",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              // Hiển thị dialog chọn nguồn ảnh
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Chọn từ thư viện'),
                                          onTap: () async {
                                            // Logic chọn ảnh từ thư viện
                                            final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                                            if (pickedFile != null) {
                                              setState(() {
                                                _image = File(pickedFile.path);
                                              });
                                            }
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Chụp ảnh'),
                                          onTap: () async {
                                            // Logic chụp ảnh từ camera
                                            final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
                                            if (pickedFile != null) {
                                              setState(() {
                                                _image = File(pickedFile.path);
                                              });
                                            }
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: _image != null ? FileImage(_image!) : null,
                              child: _image == null
                                  ? Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey[600],
                              )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                        controller: _birthDayController,
                        decoration: InputDecoration(
                          labelText: "Ngày sinh",
                          hintText: "Nhập ngày sinh",
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2070));

                          if(pickedDate != null)
                          {
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                            setState(() {
                              _birthDayController.text = formattedDate;
                              _birthDay = pickedDate;
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Vui lòng nhập ngày sinh';
                          }
                          return null;
                        }

                    ),
                    SizedBox(height: 20,),

                    //gender selection
                    FormField<String>(
                      initialValue: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select your gender.";
                        }
                        return null;
                      },
                      builder: (FormFieldState<String> state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: Text("Male"),
                                    value: "Male",
                                    groupValue: state.value,
                                    onChanged: (value) {
                                      state.didChange(value);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: Text("Female"),
                                    value: "Female",
                                    groupValue: state.value,
                                    onChanged: (value) {
                                      state.didChange(value);
                                    },
                                  ),
                                )
                              ],
                            ),
                            if (state.hasError)
                              Text(
                                state.errorText!,
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                          ],
                        );
                      },
                    ),


                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Nhập email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value){
                        _email = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng email';
                        }
                        else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
                        {
                          return 'Vui lòng nhập email hợp lệ';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: "Số điện thoại",
                        hintText: "Nhập số điện thoại",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (value){
                        _phone = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        else if(!RegExp(r'^\d{10}$').hasMatch(value))
                        {
                          return 'Vui lòng số điện thoại hợp lệ';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        hintText: "Nhập mật khẩu",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: (){
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: _isPasswordVisible,
                      onSaved: (value){
                        _password = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng nhập tên người dùng';
                        }
                        else if(!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$').hasMatch(value))
                        {
                          return 'Vui lòng nhập mật khẩu hợp lệ';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: "Xác nhận mật khẩu",
                        hintText: "Nhập mật khẩu",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: (){
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: _isPasswordVisible,
                      onSaved: (value){
                        _confirmPassword = value;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Vui lòng nhập tên người dùng';
                        }
                        else if(value != _passwordController.text)
                        {
                          return 'Mật khẩu không khớp';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),

                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Chọn thành phố",
                          border: OutlineInputBorder(),
                        ),
                        items: _cities.map((city){
                          return DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        value: _city,
                        onChanged: (String? value) {

                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Vui lòng chọn thành phố';
                          }
                          return null;
                        }
                    ),
                    SizedBox(width: 20,),

                    CheckboxListTile(
                      title: Text("Đồng ý với điểu khoản"),
                      value: _isAgreed,
                      onChanged: (value){
                        setState(() {
                          _isAgreed = value!;
                          print("Dồng ý với điểu khoản: $_isAgreed");
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    Row(
                        children: [
                          ElevatedButton(onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Tên của bạn là $_name"))
                              );
                            }
                          }, child: Text("Submit")),
                          SizedBox(width: 20,),
                          ElevatedButton(onPressed: (){
                            _formKey.currentState!.reset();
                            setState(() {
                              _name = null;
                              _email = null;
                              _password = null;
                              _fullNameController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _confirmPasswordController.clear();
                              _isPasswordVisible = false;

                            });
                          }, child: Text("reset"))

                        ]
                    ),


                  ]
              )
          ),
        )
      )
    );
  }
}
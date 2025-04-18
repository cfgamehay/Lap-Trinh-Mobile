// import 'package:flutter/material.dart';
// import '../books_screen.dart'; // Import file BooksScreen
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   // Controllers để lấy dữ liệu từ TextField
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>(); // Key để quản lý Form
//
//   // Hàm xử lý đăng nhập
//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       // Giả lập thông tin đăng nhập (username: "user", password: "pass")
//       String username = _usernameController.text;
//       String password = _passwordController.text;
//
//       if (username == "user" && password == "pass") {
//         // Đăng nhập thành công, điều hướng đến BooksScreen
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Đăng nhập thành công!")),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => BooksScreen()),
//         );
//       } else {
//         // Đăng nhập thất bại
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Tên người dùng hoặc mật khẩu không đúng!")),
//         );
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5E6F0), // Light pink background
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Form(
//             key: _formKey, // Gắn key cho Form
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // "Sign in" title
//                 Text(
//                   'Sign in',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 40),
//
//                 // Username TextField
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     labelStyle: TextStyle(color: Colors.black54),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black54),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Vui lòng nhập tên người dùng';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//
//                 // Password TextField
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true, // Hides password input
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Colors.black54),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black54),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Vui lòng nhập mật khẩu';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 40),
//
//                 // Sign in Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _login, // Gọi hàm đăng nhập khi nhấn nút
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.purple,
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       'SIGN IN',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
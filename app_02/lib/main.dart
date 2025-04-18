import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:app_02/MyScaffold.dart';
// import 'package:app_02/MyAppBar.dart';
// import 'package:app_02/MyText.dart';
// import 'package:app_02/MyContainer.dart';
// import 'package:app_02/myWidget01/MyColumnAndRow.dart';
// import 'package:app_02/myWidget01/MyLoginScreen.dart';
// import 'package:app_02/MyButton_2.dart';
// import 'package:app_02/MyGestures.dart';
// import 'myWidget01/MyTextField.dart';
// import 'MyTextFeild2.dart';
import 'my_widgets_02_form/f1_form_basic.dart';
import 'my_widgets_02_form/f2_form_TextFormField.dart';
import 'my_widgets_02_form/f3_form_DropDown.dart';
import 'my_widgets_02_form/f4_form_Selection.dart';
import 'my_widgets_02_form/f5_form_CheckboxListTile.dart';
import 'my_widgets_02_form/f6_form_DatePicker.dart';
import 'my_widgets_02_form/f8_ScrollView.dart';
import 'my_widgets_02_form/f7_form_ImagePicker.dart';
import 'package:app_02/userMS/view/UserListScreen.dart';
import 'package:app_02/NoteApp/view/NoteListScreen.dart';
// import 'package:app_02/userMS/view/LoginScreen.dart';
import 'package:app_02/NoteApp/view/LoginScreen.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: NoteListScreen(),
//     );
//   }
// }


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const _AuthCheckWidget(),
    );
  }
}

// Widget riêng biệt để kiểm tra xác thực
class _AuthCheckWidget extends StatelessWidget {
  const _AuthCheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (!snapshot.hasData) {
          return LoginScreen();
        }

        final prefs = snapshot.data!;
        final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

        if (isLoggedIn) {
          return NoteListScreen(
            onLogout: () async {
              final BuildContext currentContext = context;

              // Xóa dữ liệu người dùng
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              // Sử dụng currentContext thay vì context trực tiếp
              Navigator.of(currentContext).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
              );

              print("Logout");

            },
          );
        } else {
          // Chưa đăng nhập, hiển thị màn hình đăng nhập
          return  LoginScreen();
        }
      },
    );
  }
}
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ho va ten",
                    hintText: "Nhap ho va ten",
                    border: OutlineInputBorder(),

                  ),
                ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Nhap email cua ban",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhap so dien thoai",
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngày sinh",
                  hintText: "Nhap so ngay sinh",
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  hintText: "Nhap mat khau",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                obscureText: true,
                obscuringCharacter: '!',
              ),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Cau hỏi bí mật",
                  hintText: "nhap cau hoi bi mat",
                  prefixIcon: Icon(Icons.question_answer),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                onChanged: (value){print("$value");},
              )


              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
        ],
      ),
    );
  }
}

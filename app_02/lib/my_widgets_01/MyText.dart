import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),

      body: Center(
        child: Column(
          children: [
            //Tạo khoảng cách
            const SizedBox(height: 50),
            const Text("Xin chào tôi là Bình"),
            const SizedBox(height: 20),
            const Text(
              "Ui cha cái này nhiều quá trời nhiều nhìn mà thấy hoa mắt chóng mặt ù tai, chân tay bủn rủn, tóc tai xuề xúa,....",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Đây chỉ là một dòng text bình thường chỉ là người viết nó viết lan man để cho nó dài thôi không có gì quá đáng để phải chú ý",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,

            )
          ],
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

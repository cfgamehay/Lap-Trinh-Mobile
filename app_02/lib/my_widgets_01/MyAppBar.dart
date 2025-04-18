import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //Tiêu đề
          title: Text("My nav bar"),
          //màu nền
          backgroundColor: Colors.orange,
          //độ bóng
          elevation: 4,
          //các nút chức năng
          actions: [
            //nút chức năng
            IconButton(onPressed: () {
              print("b1");
            }, icon: Icon(Icons.currency_bitcoin)),
            //nút chức năng
            IconButton(onPressed: () {
              print("b2");
            }, icon: Icon(Icons.currency_exchange)),
            //nút chức năng
            IconButton(onPressed: () {
              print("more");
            }, icon: Icon(Icons.more_vert)),
          ]
      ),

      //Phần thân
      body: Center(
        child: Text("Hello Flutter"),
      ),
      //nút nổi bên dưới, cạnh phải
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),

      //Thanh nav bên dưới cùng chứa nhiều phần tử (các nút chức năng)
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
      ]),
    );
  }
}
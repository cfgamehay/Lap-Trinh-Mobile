import 'package:flutter/material.dart';

class MyColumnAndRow extends StatelessWidget {
  const MyColumnAndRow({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My Column and row"), backgroundColor: Colors.orange),

      // body: Center(
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Icon(Icons.watch),
      //             Icon(Icons.snowing),
      //             Icon(Icons.person),
      //             Icon(Icons.category),
      //           ]
      //         ),
      //         Row(
      //             children: [
      //               Icon(Icons.watch),
      //               Icon(Icons.snowing),
      //               Icon(Icons.person),
      //           ]
      //         )
      //       ],
      //     )
      // ),



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

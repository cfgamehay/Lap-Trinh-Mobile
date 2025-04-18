import 'package:flutter/material.dart';
//Eventlistener
class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),

      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Center(child: Text("Container")),
              ),
              onTap: () {
                print("Container was tapped");
              },
              onDoubleTap: () {
                print("Container was double tapped");
              },
              onPanUpdate: (details) {
                print("Container was long pressed and moved to ${details.localPosition}");
              },

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

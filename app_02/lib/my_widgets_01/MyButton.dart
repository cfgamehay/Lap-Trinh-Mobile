import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){print('elevated button');}, child: Text("Elevated button", style: TextStyle(color: Colors.blueAccent, fontSize: 24))),
            SizedBox(height: 20),
            TextButton(onPressed: (){print('text button');}, child: Text("Text button", style: TextStyle(color: Colors.purple, fontSize: 24))),
            SizedBox(height: 20),
            OutlinedButton(onPressed: (){print('outlined button');}, child: Text("Outlined button", style: TextStyle(color: Colors.orange, fontSize: 24))),
            SizedBox(height: 20),
            IconButton(onPressed: (){print('icon button');}, icon: Icon(Icons.favorite, size: 50)),
            SizedBox(height: 20),
            FloatingActionButton(onPressed: (){print('floating button');}, child: Icon(Icons.add))

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

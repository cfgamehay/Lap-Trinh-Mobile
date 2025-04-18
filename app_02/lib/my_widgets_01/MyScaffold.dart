import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget{
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(
        title: Text("My nav bar"),

      ),

      backgroundColor: Colors.yellowAccent,

      body: Center(
        child: Text("Hello Flutter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
      ]),
    );
  }
}
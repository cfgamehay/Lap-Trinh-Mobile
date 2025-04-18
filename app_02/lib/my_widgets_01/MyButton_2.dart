import 'package:flutter/material.dart';

class MyButton_2 extends StatelessWidget {
  const MyButton_2({super.key});

  @override
  Widget build(BuildContext context) {
    //tra ve scaffold - widget cung cap bố cục material design cơ bản
    //return widget
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),

      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print('elevated button');
              },
              child: Text("Elevated button", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellowAccent,
                foregroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 10,
              ),
            ),
            SizedBox(height: 20),
            // TextButton(onPressed: (){print('text button');}, child: Text("Text button", style: TextStyle(color: Colors.purple, fontSize: 24))),
            // SizedBox(height: 20),
            OutlinedButton(
              onPressed: null,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                side: BorderSide(color: Colors.purple, width: 3),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text("Outlined button", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            // IconButton(onPressed: (){print('icon button');}, icon: Icon(Icons.favorite, size: 50)),
            // SizedBox(height: 20),
            // FloatingActionButton(onPressed: (){print('floating button');}, child: Icon(Icons.add))
            InkWell(
              onTap: () {
                print('Meow');
              },
              onLongPress: () {
                print('Stop hovering me bruh');
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 2.7),
                ),
                child: Image(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEAFhHlcmkQt4OH_auu8MmhRyUqWKd-CFZTg&s'),
                  width: 150,

                )
              ),
            ),
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

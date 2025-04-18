import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;
  MyStatelessWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  int luck = 0;
  String title = "Chào bình, Tài phú của bạn là: 0. Bâm nút để tăng tài phú!";

  void _updateTitle()
  {
    setState(() {
      luck+=1;
      title = "Tài phú của Binh tăng lên thành ${luck}!";
    });
  }

  void _resetTaiPhu()
  {
    setState(() {
      luck = 0;
      title = "Tài phú của bạn đã bị lấy đi!";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài phú ?"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(title),
            ElevatedButton(
                onPressed: _updateTitle,
                child: Text("Tăng tài phú")
            ),
            ElevatedButton(onPressed: _resetTaiPhu, child: Text("Reset tài phú"))
          ],
        ),
      ),
    );
  }
}
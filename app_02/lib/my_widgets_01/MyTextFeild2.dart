import 'package:flutter/material.dart';

class MyTextFeild2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _myTextFeildState();
}

class _myTextFeildState extends State<MyTextFeild2>{
  final _textController = TextEditingController();
  String _inputText = '';
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My TEXT"), backgroundColor: Colors.orange),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Bat ki thu gi",
                  hintText: "anything!!",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: (){
                        _textController.clear();
                      }
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              SizedBox(height: 20,),
              Text("Bạn đã nhập : $_inputText"),

            ]
          )
      )
    );
  }
}
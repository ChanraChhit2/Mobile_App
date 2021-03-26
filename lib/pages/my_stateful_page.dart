import 'package:flutter/material.dart';

class MyStatefulPage extends StatefulWidget {

  @override
  _MyStatefulPageState createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  String _text = "Hello App";
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: _dark == true ? Colors.black : Colors.pink,
      title: Text(_text),
      actions: [
        IconButton(icon: Icon(Icons.refresh), onPressed: (){
          setState(() {
            // if(_dark == false){
            //   _dark = true;
            // }
            // else{
            //   _dark = false;
            // }

            _dark = !_dark;
          });
        }),
      ],
    );
  }

  get _buildBody {
    return Container(
      color: _dark ? Colors.grey : Colors.white,
      alignment: Alignment.center,
      // ignore: deprecated_member_use
      // child: RaisedButton(
      //   child: Text("OK"),
      //   onPressed: (){
      //     print("OK click");
      //     setState(() {
      //       _text = "Hello world App";
      //     });
      //   },
      // ),

      padding: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter Password",
        ),
      ),
    );
  }
}

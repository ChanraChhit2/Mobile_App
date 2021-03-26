import 'package:flutter/material.dart';
import 'package:hello1/models/item.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  DetailPage({this.item});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _widthOfScreen,_heightOfscreen;
  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heightOfscreen= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }
  get _buildAppBar{
    return AppBar(
      leading: IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){
        Navigator.of(context).pop();
      }),
      title: Text("Image"),
    );
  }

  get _buildBody{
    return Container(
      width: _widthOfScreen,
      height: _heightOfscreen,
      child: Image.network(widget.item.img),
    );
  }

}


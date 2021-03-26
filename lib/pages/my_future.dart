import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyFuture extends StatefulWidget {
  @override
  _MyFutureState createState() => _MyFutureState();
}

class _MyFutureState extends State<MyFuture> {
  
  Future<String> GoodMorning(){
    Future<String> data = Future.delayed(Duration(seconds: 5), () => "Good Morning Ra");
    return data;
  }

  String sayHi(){
    return "Hi";
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Future Examle"),),
      body: _buildBody(),
    );
  }

  _buildBody(){
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<String>(
        future: GoodMorning(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Text(snapshot.data, style: TextStyle(fontSize: 20.0),);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
  
}


import 'package:flutter/material.dart';
import 'file:///C:/Users/raaut/AndroidStudioProjects/hello1/lib/helpers/mylogin.dart';
import 'package:hello1/pages/mainpage.dart';
import 'package:hello1/pages/my_future.dart';
import 'package:hello1/pages/my_listview.dart';
import 'package:hello1/pages/my_localapi_page.dart';
import 'package:hello1/pages/my_stateful_page.dart';
import 'package:hello1/pages/randomuser_page.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLocalAPIPage(),
    );
  }
}
// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//    List<int> numbers = [4, 2, 4 , 1, 5];
//
//
//     return Scaffold(
//       appBar: AppBar(title: Text("List Example"),),
//         body: Container(),
//     );
//   }
// }

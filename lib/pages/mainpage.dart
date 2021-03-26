import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.cyan,
      leading: Icon(Icons.face),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("ចុងក្រោយ", style: TextStyle(fontFamily: "Khmer OS Fasthand")),
          Text("ល្បី"),
          Text("ទាន់សម័យ"),
        ],
      ),
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: _buildColumn,
    );
  }

  String _image1 ="https://ultimatemotorcycling.com/wp-content/uploads/2019/03/2019-liebacks-lounge-rider-aids-1.jpg";
  String _image2 ="https://images.pexels.com/photos/1915149/pexels-photo-1915149.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  String _image3 = "https://cdn.shopify.com/s/files/1/0951/1406/articles/2019-bmw-gs-riders-stand-out-among-adv-noise_1_864x.jpg?v=1577121162";

  get _buildColumn {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(_image1),
          _buildImage(_image2),
          _buildImage(_image3),
        ],
      ),
    );
  }

  _buildImage(String img) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.pink,
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  // get _buildCircle {
  //   return Container(
  //     // padding: EdgeInsets.all(20),
  //     // alignment: Alignment.center,
  //     // child: Image.asset("assets/images/2.jpg"),
  //     alignment: Alignment.center,
  //     color: Colors.grey.withOpacity(0.5),
  //     child: Container(
  //       width: 200,
  //       height: 200,
  //       // color: Colors.deepPurple,
  //       decoration: BoxDecoration(
  //         color: Colors.pink,
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(40),
  //           bottomRight: Radius.circular(40),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  get _buildBottom {
    return BottomAppBar(
      color: Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print("home clicked");
              }),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                print("home person");
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print("home more_horiz");
              }),
        ],
      ),
    );
  }
}

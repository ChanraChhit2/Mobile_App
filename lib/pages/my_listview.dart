import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello1/models/item.dart';

import 'detail_page.dart';

// class MyListView extends StatefulWidget {
//   @override
//   _MyListViewState createState() => _MyListViewState();
// }
//
// class _MyListViewState extends State<MyListView> {
//   double _widthOfScreen,_heightOfscreen;
//   @override
//   Widget build(BuildContext context) {
//     _widthOfScreen = MediaQuery.of(context).size.width;
//     _heightOfscreen= MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: _buildAppBar,
//       body: _buildBody,
//     );
//   }
//
//   get _buildAppBar{
//     return AppBar(
//       title: Text("My ListView"),
//       backgroundColor: Colors.black,
//     );
//   }
//
//   get _buildBody{
//     return Container(
//       color: Colors.black87,
//       alignment: Alignment.center,
//       child: _buildParentListView,
//     );
//   }
//
// get _buildParentListView{
//     return ListView(
//      children: [
//        _buildStoryListView,
//        _buildlistView,
//        _buildStoryListView
//
//      ],
//     );
// }
//
//   get _buildStoryListView{
//     return Container(
//       padding: EdgeInsets.only(top:10,bottom: 10),
//       height: 170,
//       width: _widthOfScreen,
//       child: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemCount: itemstorylist.length,
//           itemBuilder: (context , index){
//             return _buildStoryItem(itemstorylist[index]);
//           }),
//     );
//   }
//
//   _buildStoryItem(Item item){
//     return Container(
//       alignment: Alignment.center,
//       child: Container(
//         width: 150,
//         height: 150,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image: NetworkImage(item.img),
//             fit: BoxFit.cover,
//           ),
//           border: Border.all(width: 5, color: Colors.blueGrey[700]),
//         ),
//         margin: EdgeInsets.only(top: 5,bottom: 5,right: 5),
//       ),
//
//     );
//   }
//
//   get _buildlistView{
//    return ListView.builder(
//        shrinkWrap: true,
//        physics: BouncingScrollPhysics(),
//        itemCount: itemList.length,
//        itemBuilder: (context,index){
//          return _buildItem(itemList[index]);
//        }
//    );
//   }
//   _buildItem(Item item){
//     return ListTile(
//        title: Container(
//          height: 50,
//          alignment: Alignment.centerLeft,
//          child: Text(
//              "${item.title}",
//              style: TextStyle(color: Colors.white70, fontSize: 20),
//          ),
//        ),
//       // title: Text("Item ${item.title}" ),
//       subtitle: Container(
//         height: 300,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image: NetworkImage(item.img),
//             fit: BoxFit.cover,
//           ),
//             boxShadow: [
//               BoxShadow(
//               color: Colors.white24,
//              offset: Offset(0,0),
//             blurRadius: 5,
//             spreadRadius: 2
//             ),
//           ],
//         ),
//
//       ),
//
//     );
//   }
//
// }


class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
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
      title: Text("My ListView"),
      backgroundColor: Colors.black,
    );
  }

  get _buildBody{
    return Container(
      color: Colors.grey[900],
      alignment: Alignment.center,
      child: _buildParentListView,
    );
  }

  get _buildParentListView{
    return ListView(
      children: [
        _buildStoryListView,
        _buildlistView,
        _buildStoryListView

      ],
    );
  }

  get _buildStoryListView{
    return Container(
      padding: EdgeInsets.only(top:10,bottom: 10),
      height: 170,
      width: _widthOfScreen,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemstorylist.length,
          itemBuilder: (context , index){
            return _buildStoryItem(itemstorylist[index]);
          }),
    );
  }

  _buildStoryItem(Item item){
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> DetailPage(item: item,)
            ),
          );
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(item.img),
              fit: BoxFit.cover,
            ),
            border: Border.all(width: 5, color: Colors.blueGrey[700]),
          ),
          margin: EdgeInsets.only(top: 5,bottom: 5,right: 5),
        ),
      ),

    );
  }

  get _buildlistView{
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context,index){
          return _buildItem(itemList[index]);
        }
    );
  }
  _buildItem(Item item){

    return Container(
      height: 400,
      width: _widthOfScreen,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text(
              "${item.title}",
              style: TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> DetailPage(item: item,)
                ),
              );
            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(item.img),
                  fit: BoxFit.cover,
                ),

              ),

            ),
          ),
          Container(

            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.favorite_border), onPressed:(){}),
                        IconButton(icon: Icon(Icons.book_online), onPressed:(){}),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.comment_outlined), onPressed: (){})
                ],
              ),
            ),

          )
        ],
      ),
    );

  }

}
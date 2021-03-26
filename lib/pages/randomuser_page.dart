import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hello1/models/randomuser_model.dart';
import 'package:hello1/repos/randomuser_repos.dart';

class RandomUserPage extends StatefulWidget {
  @override
  _RandomUserPageState createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  Future<RandomUser> _data;
  List<Result> _results;

  @override
  void initState() {
    super.initState();
    _data = readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Random User"),
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: FutureBuilder<RandomUser>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("snapshot.error : ${snapshot.error}");
            return Text("Error while reading data");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            _results = snapshot.data.results;
            return _buildListView;
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  get _buildListView {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _data = readData();
        });
      },
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: _results.length,
        itemBuilder: (context, index) {
          return _buildItem(_results[index]);
        },
      ),
    );
  }

  _buildItem(Result item) {
    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
            icon: Icons.notifications_off_rounded,
            color: Colors.green,
            caption: "Mute",
            onTap: () {
              print("Mute Clicked");
            },
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.more_horiz,
            color: Colors.grey[300],
            onTap: () {
              _showAlertDialog(item);
            },
          ),
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: "Delete",
            onTap: () {
              print("delete clicked 1");
              setState(() {
                _results.remove(item);
              });
            },
          ),
        ],
        child: ListTile(
          leading: Image.network(item.picture.medium),
          title: Text("${item.name.first} ${item.name.last}"),
          subtitle: Text("${item.email}"),
          trailing: Icon(Icons.navigate_next),
          onLongPress: () {
            _showAlertDialog(item);
          },
        ),
      ),
    );
  }

  _showAlertDialog(Result item) {
    showDialog(
      context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Options"),
            content: Container(
              height: 150,
              width: 300,
              child: Column(
                children: [
                  Card(
                    color: Colors.grey,
                    child: ListTile(
                      leading: Icon(Icons.folder_open_outlined),
                      title: Text("Open"),
                      onTap: () {
                        print("Open clicked");
                        setState(() {
                          _results.add(item);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Card(
                    color: Colors.grey,
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text("delete"),
                      onTap: () {
                        print("delete clicked 2");
                        setState(() {
                          _results.remove(item);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

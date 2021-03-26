import 'package:flutter/material.dart';
import 'package:hello1/models/article_model.dart';
import 'package:hello1/repos/my_localapi_repo.dart';

class InsertLocalAPIPage extends StatefulWidget {
  @override
  _InsertLocalAPIPageState createState() => _InsertLocalAPIPageState();
}

class _InsertLocalAPIPageState extends State<InsertLocalAPIPage> {

  var _titleCtrl = TextEditingController();
  var _bodyCtrl = TextEditingController();
  var _imageCtrl = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  
  _showMessage(String text) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
          content: Text(text),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      body: InkWell(
        child: _buildBody,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Insert"),
      actions: [
        IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: (){
              if (_titleCtrl.text.trim().isNotEmpty && _bodyCtrl.text.trim().isNotEmpty && _imageCtrl.text.trim().isNotEmpty) {
                Article article = Article(
                  title: _titleCtrl.text.trim(),
                  body: _bodyCtrl.text.trim(),
                  img: _imageCtrl.text.trim(),
                  date: DateTime.now().toIso8601String(),
                );
                insertData(article).then((value) {
                  print("value: $value");
                  if(value == "inserted") {
                    _showMessage("Data inserted");
                    Navigator.of(context).pop();
                  } else {
                    _showMessage("Something went wrong");
                  }
                });
              }
              else {
                _showMessage("all fields are required.");
              }
            }),
      ],
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 300,
          color: Colors.grey[200],
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitleText,
              _buildBodyText,
              _buildImageText,
            ],
          ),
        ),
      ),
    );
  }

  get _buildTitleText {
    return TextField(
      controller: _titleCtrl,
      decoration: InputDecoration(
        hintText: "Enter title",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.text_fields),
      ),
      autocorrect: true,
      obscureText: false, // true: password
      textCapitalization: TextCapitalization.words,
    );
  }

  get _buildBodyText {
    return TextField(
      controller: _bodyCtrl,
      decoration: InputDecoration(
        hintText: "Enter body",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.article),
      ),
      maxLines: 3,
      textCapitalization: TextCapitalization.sentences,
    );
  }

  get _buildImageText {
    return TextField(
      controller: _imageCtrl,
      decoration: InputDecoration(
        hintText: "Enter Image url",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.image),
      ),
      maxLines: 3,
    );
  }
}

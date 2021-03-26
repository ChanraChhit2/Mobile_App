import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:hello1/models/article_model.dart';
import 'package:hello1/pages/insert_localapi_page.dart';

Future<ArticleModel> readArticleData() async {
  String url = "http://172.20.10.3/api4flutter/read.php";

  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    String body = response.body;
    return compute(articleModelFromJson, body);
  }
  else{
    throw Exception("Error while reading data");
  }
}

Future<String> insertData(Article article) async {
  String url = "http://172.20.10.3/api4flutter/insert.php";

  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

Future<String> updateData(Article article) async {
  String url = "http://172.20.10.3/api4flutter/update.php";

  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

Future<String> deleteData(Article article) async {
  String url = "http://172.20.10.3/api4flutter/delete.php";

  http.Response response = await http.post(url, body: article.toJson());

  if(response.statusCode == 200){
    return response.body;
  }
  else{
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

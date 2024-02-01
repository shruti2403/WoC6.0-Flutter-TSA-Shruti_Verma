import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/article_model.dart';

class News{
  List<ArticleModel> news = [];

  Future<void>getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4e0a61fa69ec43479aa8064353b1bc43";

    var response = await http.get(url as Uri);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok")
      {
        jsonData["articles"].forEach((element)
        {
          if(element["urlToImage"] != null && element['description'] != null){
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"],
            );

            news.add(articleModel);
          }
        });
      }
  }
}
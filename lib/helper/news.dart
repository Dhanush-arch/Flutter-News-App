import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_news/models/article_models.dart';

class News {
  List<ArticleModel> news = [];

  String url = "";

  Future<void> getNews() async {
    String url = "";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            desc: element["description"],
            url: element['url'],
            imageUrl: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

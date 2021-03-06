import 'dart:convert';

import 'package:flutter_clean/domain/entities/article.dart';
import 'package:flutter_clean/secret/secret.dart';
import 'package:http/http.dart' as http;

class NewsColombia {
  List<Article> newsCol = [];

  Future<void> getNewsColombia() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=co&apiKey=$apiKey';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          newsCol.add(article);
        }
      });
    }
  }
}

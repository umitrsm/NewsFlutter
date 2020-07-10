import 'dart:convert';

import 'package:flutterapp/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsProv {
  List<News> newsUs = [];
  List<News> newsTr = [];
  List<News> newsTop = [];

  Future<void> getNewsUs() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=1784eb677bb34338a3d8b5ebb53959f4";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          News newnews = News(
              author: element["auther"],
              content: element["content"],
              description: element["description"],
              title: element["title"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          newsUs.add(newnews);
        }
      });
    }
  }
}

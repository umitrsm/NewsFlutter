import 'package:flutter/material.dart';
import 'package:flutterapp/models/news.dart';
import 'package:flutterapp/services/news_service.dart';

class NewsDetailScreen extends StatefulWidget {
  static const routeName = 'newsdetails';
  final int position;

  const NewsDetailScreen(this.position);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool _loading = true;
  List<News> newsus = new List<News>();
  News newdetail;
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    NewsProv newsProv = NewsProv();
    await newsProv.getNewsUs();
    newsus = newsProv.newsUs;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final position = ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
                children: <Widget>[
                  Text(
                    newsus[position].title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(newsus[position].author),
                  Text(
                    newsus[position].description,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  Image.network(newsus[position].urlToImage),
                  Text(
                    newsus[position].content,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}

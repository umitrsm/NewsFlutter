import 'package:flutter/material.dart';
import 'package:flutterapp/models/news.dart';
import 'package:flutterapp/services/news_service.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController;
  List<News> newsus = new List<News>();
  bool _loading = true;
  int itemCount;
  void initState() {
    super.initState();
    getNews();
    pageController = PageController(initialPage: 1, viewportFraction: 1);
  }

  void getNews() async {
    NewsProv newsProv = NewsProv();
    await newsProv.getNewsUs();
    newsus = newsProv.newsUs;
    setState(() {
      _loading = false;
      itemCount = newsus.length < 8 ? newsus.length : 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'News App',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: itemCount,
                      itemBuilder: (context, position) {
                        return Container(
                          child: imageSlider(position),
                        );
                      }),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: itemCount,
                        itemBuilder: (BuildContext cnt, index) {
                          return InkWell(
                            onTap: () {
                              {
                                pageController.jumpToPage(index);
                              }
                            },
                            child: Container(
                              width: 51.25,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Colors.white,
                                  )),
                              child: Center(
                                  child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
    ));
  }

  imageSlider(int index) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget) {
          return Stack(
            children: <Widget>[
              Image.network(
                newsus[index].urlToImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.black87,
                  padding: EdgeInsets.all(5),
                  height: 80,
                  width: 400,
                  child: Text(
                    newsus[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

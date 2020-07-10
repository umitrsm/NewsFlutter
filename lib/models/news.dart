class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAt;
  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  });
/*  factory News.fromJSON(Map<String, dynamic> json) {
    return News(
        author: json["auther"],
        content: json["content"],
        description: json["description"],
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"]);
  }*/
}

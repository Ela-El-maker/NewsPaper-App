import 'dart:convert';

import 'package:ztm/pages/newsPage.dart';

List<NewsArticle> newsArticleFromJson(String str) =>
    List<NewsArticle>.from(jsonDecode(str)['articles']
        .map((x) => NewsArticle.fromJson(Map<String, dynamic>.from(x))));

class NewsArticle {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String content;
  DateTime publishedAt;

  NewsArticle({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });
  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content'],
        publishedAt: DateTime.parse(json['publishedAt']),
      );
}

class Source {
  dynamic id;
  String name;
  Source({
    this.id,
    required this.name,
  });
  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}

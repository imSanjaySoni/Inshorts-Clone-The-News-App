import 'package:hive/hive.dart';

import 'news_model.dart';
// part 'hive_news_model.g.dart';

@HiveType(typeId: 1)
class HiveArticles extends HiveObject {
  HiveArticles(
      {this.source,
      this.author,
      this.title,
      this.content,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage});

  @HiveField(0)
  Source source;
  @HiveField(1)
  String author;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  String url;
  @HiveField(5)
  String urlToImage;
  @HiveField(6)
  String publishedAt;
  @HiveField(7)
  String content;
}

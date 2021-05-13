import 'package:flutter_news_task_app/core/base/model/base_model.dart';

class NewsModel extends BaseModel {
  String id;
  String title;
  String url;
  String imageUrl;
  String newsSite;
  String summary;
  String publishedAt;
  String updatedAt;
  List<Null> launches;
  List<Null> events;

  NewsModel(
      {this.id,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt,
      this.updatedAt,
      this.launches,
      this.events});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    newsSite = json['newsSite'];
    summary = json['summary'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    if (json['launches'] != null) {
      launches = new List<Null>();
      json['launches'].forEach((v) {});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['newsSite'] = this.newsSite;
    data['summary'] = this.summary;
    data['publishedAt'] = this.publishedAt;
    data['updatedAt'] = this.updatedAt;

    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return NewsModel.fromJson(json);
  }
}

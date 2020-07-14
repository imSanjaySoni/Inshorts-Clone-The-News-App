import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/app/dio/dio.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:provider/provider.dart';

abstract class NewsFeedRepository {
  Future<List<Articles>> getNewsByTopic(String topic);

  Future<List<Articles>> getNewsByCategory(String category);

  Future<List<Articles>> getNewsBySearchQuery(String query);

  Future<List<Articles>> getNewsFromLocalStorage();
}

class NewsFeedRepositoryImpl implements NewsFeedRepository {
  final BuildContext context;
  NewsFeedRepositoryImpl(this.context);

  @override
  Future<List<Articles>> getNewsByTopic(String topic) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);
    final String url = "everything?q=$topic";
    Response response = await GetDio.getDio().get(url);
    if (response.statusCode == 200) {
      List<Articles> articles = NewsModel.fromJson(response.data).articles;
      provider.setDataLoaded(true);
      return articles;
    } else {
      provider.setDataLoaded(true);
      throw Exception();
    }
  }

  @override
  Future<List<Articles>> getNewsByCategory(String category) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);
    final String url = "top-headlines?country=in&category=$category";

    Response response = await GetDio.getDio().get(url);
    if (response.statusCode == 200) {
      List<Articles> articles = NewsModel.fromJson(response.data).articles;
      provider.setDataLoaded(true);
      return articles;
    } else {
      provider.setDataLoaded(true);
      throw Exception();
    }
  }

  @override
  Future<List<Articles>> getNewsBySearchQuery(String query) async {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);

    final String url = "everything?q=$query";

    Response response = await GetDio.getDio().get(url);
    if (response.statusCode == 200) {
      print(response.data['status']);
      List<Articles> articles = NewsModel.fromJson(response.data).articles;
      print(articles.length);
      provider.setDataLoaded(true);
      return articles;
    } else {
      provider.setDataLoaded(true);
      throw Exception();
    }
  }

  @override
  Future<List<Articles>> getNewsFromLocalStorage() {
    throw UnimplementedError();
  }
}

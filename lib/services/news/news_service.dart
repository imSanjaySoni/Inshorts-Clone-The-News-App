import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inshort_clone/app/dio/dio.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/services/news/offline_service.dart';
import 'package:provider/provider.dart';

abstract class NewsFeedRepository {
  Future<List<Articles>> getNewsByTopic(String topic);

  Future<List<Articles>> getNewsByCategory(String category);

  Future<List<Articles>> getNewsBySearchQuery(String query);

  List<Articles> getNewsFromLocalStorage(String box);
}

class NewsFeedRepositoryImpl implements NewsFeedRepository {
  final BuildContext context;
  NewsFeedRepositoryImpl(this.context);

  @override
  Future<List<Articles>> getNewsByTopic(String topic) async {
    final String url = "everything?q=$topic";
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);
    provider.setLastGetRequest("getNewsByTopic", topic);
    print("getNewsByTopic" + " " + topic);

    Response response = await GetDio.getDio().get(url);
    if (response.statusCode == 200) {
      List<Articles> articles = NewsModel.fromJson(response.data).articles;

      provider.setDataLoaded(true);
      addArticlesToUnreads(articles);

      return articles;
    } else {
      provider.setDataLoaded(true);
      throw Exception();
    }
  }

  @override
  Future<List<Articles>> getNewsByCategory(String category) async {
    final String url = "top-headlines?country=in&category=$category";
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setDataLoaded(false);
    provider.setLastGetRequest("getNewsByTopic", category);

    Response response = await GetDio.getDio().get(url);
    if (response.statusCode == 200) {
      List<Articles> articles = NewsModel.fromJson(response.data).articles;

      provider.setDataLoaded(true);
      addArticlesToUnreads(articles);

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
      List<Articles> articles = NewsModel.fromJson(response.data).articles;

      addArticlesToUnreads(articles);
      provider.setDataLoaded(true);
      return articles;
    } else {
      provider.setDataLoaded(true);
      throw Exception();
    }
  }

  @override
  List<Articles> getNewsFromLocalStorage(String fromBox) {
    List<Articles> articles = [];
    final Box<Articles> hiveBox = Hive.box<Articles>(fromBox);
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setLastGetRequest("getNewsFromLocalStorage", fromBox);

    print(fromBox);

    if (hiveBox.length > 0) {
      for (int i = 0; i < hiveBox.length; i++) {
        Articles article = hiveBox.getAt(i);
        articles.add(article);
      }
      provider.setDataLoaded(true);

      return articles;
    } else {
      provider.setDataLoaded(true);
      List<Articles> articles = [];
      return articles;
    }
  }
}

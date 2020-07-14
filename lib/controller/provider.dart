import 'package:flutter/material.dart';

class FeedProvider extends ChangeNotifier {
  String appBarTitle;
  int activeCategory = 1;
  bool hasDataLoaded = false;
  bool searchAppBarVisible = true;
  bool appBarVisible = true;
  bool feedBottomActionbarVisible = false;

  //
  bool get gethasDataLoaded => this.hasDataLoaded;

  int get getActiveCategory => this.activeCategory;

  String get getAppBarTitle => this.appBarTitle;

  bool get getSearchAppBarVisible => this.searchAppBarVisible;

  bool get getAppBarVisible => this.appBarVisible;

  bool get getFeedBottomActionbarVisible => this.feedBottomActionbarVisible;

  ///

  void setActiveCategory(int activeCategory) {
    this.activeCategory = activeCategory;
    notifyListeners();
  }

  void setAppBarTitle(String appBarTitle) {
    this.appBarTitle = appBarTitle;
    notifyListeners();
  }

  void setDataLoaded(bool status) {
    this.hasDataLoaded = status;
    notifyListeners();
  }

  void setSearchAppBarVisible(bool searchAppBarVisible) {
    this.searchAppBarVisible = searchAppBarVisible;
    notifyListeners();
  }

  void setAppBarVisible(bool appBarVisible) {
    this.appBarVisible = appBarVisible;
    notifyListeners();
  }

  void setFeedBottomActionbarVisible(bool feedBottomActionbarVisible) {
    this.feedBottomActionbarVisible = feedBottomActionbarVisible;
    notifyListeners();
  }
}

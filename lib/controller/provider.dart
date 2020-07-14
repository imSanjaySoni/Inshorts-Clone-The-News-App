import 'package:flutter/material.dart';

class FeedProvider extends ChangeNotifier {
  String appBarTitle;
  int activeCategory = 1;
  bool hasDataLoaded = false;
  bool searchAppBarVisible = true;
  bool appBarVisible = false;
  bool feedBottomActionbarVisible = false;
  int curentArticalIndex = 0;
  PageController feedPageController;

  //

  bool get gethasDataLoaded => this.hasDataLoaded;

  int get getActiveCategory => this.activeCategory;

  String get getAppBarTitle => this.appBarTitle;

  bool get getSearchAppBarVisible => this.searchAppBarVisible;

  bool get getAppBarVisible => this.appBarVisible;

  bool get getFeedBottomActionbarVisible => this.feedBottomActionbarVisible;

  int get getCurentArticalIndex => this.curentArticalIndex;

  PageController get getfeedPageController => this.feedPageController;

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

  void setCurentArticalIndex(int curentArticalIndex) {
    this.curentArticalIndex = curentArticalIndex;
    notifyListeners();
  }

  void setfeedPageController(PageController pageController) {
    this.feedPageController = pageController;
    notifyListeners();
  }
}

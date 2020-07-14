import 'dart:async';

class FeedController {
  FeedController() {
    addavctiveCategory(1);
  }

  static StreamController _currentPage = StreamController<int>.broadcast();

  static StreamController _currentArtical = StreamController<int>.broadcast();

  static StreamController _currentFeedIndex = StreamController<int>.broadcast();

  static StreamController _hasAppBarVisible =
      StreamController<bool>.broadcast();

  static StreamController _feedActionBar = StreamController<bool>.broadcast();

  static StreamController _serchFeedAppBar = StreamController<bool>.broadcast();

  static StreamController _avctiveCategory = StreamController<int>.broadcast();

  //

  static Stream<int> get _currentPageStream => _currentPage.stream;

  static Stream<int> get currentArticalStream => _currentArtical.stream;

  static Stream<int> get avctiveCategory => _avctiveCategory.stream;

  static Stream<int> get _currentFeedIndeStream => _currentFeedIndex.stream;

  static Stream<bool> get appBarStream => _hasAppBarVisible.stream;

  static Stream<bool> get searchFeedAppBarStream => _serchFeedAppBar.stream;

  static Stream<bool> get feedBottomActionBarStream => _feedActionBar.stream;

  // static Stream<bool> get hasDataLoadedStream => _dataLoaded.stream;

//

  static void addCurrentPage(int page) {
    _currentPage.sink.add(page);
  }

  static void addavctiveCategory(int category) {
    _avctiveCategory.sink.add(category);
  }

  static void curentArticalIndex(int index) {
    _hasAppBarVisible.sink.add(index);
  }

  static void addCurrentFeedIndex(int page) {
    _currentFeedIndex.sink.add(page);
  }

  static void hasFeedBottomActionBarVisible(bool status) {
    _feedActionBar.sink.add(status);
  }

  static void appBarVisible(bool status) {
    _hasAppBarVisible.sink.add(status);
  }

  static void searchFeedAppBarVisible(bool status) {
    _serchFeedAppBar.sink.add(status);
  }

  // static void dataLoadedStatus(bool status) {
  //   _dataLoaded.sink.add(status);
  // }

  static int getCurrentPage(Function function) {
    int page = 1;
    _currentPageStream.listen(
      (onData) {
        if (onData != null) {
          page = onData;
          function(onData);
        }
      },
    );
    return page;
  }

  static int getCurrentFeedIndex(Function function) {
    int page = 0;

    _currentFeedIndeStream.listen(
      (onData) {
        if (onData != null) {
          page = onData;
          function(onData);
        }
      },
    );
    return page;
  }

  // static bool getAppbarStatus() {
  //   bool status = false;

  //   _appBarStream.listen(
  //     (onData) {
  //       if (onData != null) {
  //         status = onData;
  //       }
  //     },
  //   );
  //   return status;
  // }

  // static bool getBottomActionbarStatus() {
  //   bool status = false;

  //   bottomActionBarStream.listen(
  //     (onData) {
  //       if (onData != null) {
  //         status = onData;
  //       }
  //     },
  //   );
  //   return status;
  // }

  static void dispos(String stream) {
    _currentFeedIndex.close();
    _currentPage.close();
    _hasAppBarVisible.close();
    _avctiveCategory.close();
    _feedActionBar.close();
    _currentArtical.close();
    _serchFeedAppBar.close();
  }
}

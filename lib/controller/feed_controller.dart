import 'dart:async';

class FeedController {
  static StreamController _currentPage = StreamController<int>.broadcast();

  static Stream<int> get _currentPageStream => _currentPage.stream;

  static void addCurrentPage(int page) {
    _currentPage.sink.add(page);
  }

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

  static void dispos(String stream) {
    _currentPage.close();
  }
}

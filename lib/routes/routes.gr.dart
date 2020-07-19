import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:inshort_clone/view/photo_view/photo_expanded_screen.dart';
import 'package:inshort_clone/view/search_screen/search.dart';
import 'package:inshort_clone/view/settings_screen/settings.dart';
import 'package:inshort_clone/view/bookmarked_screen/bookmark.dart';
import 'package:inshort_clone/view/web_screen/web.dart';
import 'package:inshort_clone/view/discover_screen/discover.dart';
import 'package:inshort_clone/view/feed_screen/feed.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/view/app_base/app_base.dart';

class Router {
  static const searchScreen = '/search-screen';
  static const settingsScreen = '/settings-screen';
  static const bookmarkScreen = '/bookmark-screen';
  static const webScreen = '/web-screen';
  static const discoverScreen = '/discover-screen';
  static const feedScreen = '/feed-screen';
  static const appBase = '/';
  static const expandedImageView = '/expandedImageView';

  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.searchScreen:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
          settings: settings,
        );
      case Router.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
          settings: settings,
        );
      case Router.bookmarkScreen:
        return MaterialPageRoute(
          builder: (_) => BookmarkScreen(),
          settings: settings,
        );
      case Router.webScreen:
        if (hasInvalidArgs<WebViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebViewArguments>(args);
        }
        final typedArgs = args as WebViewArguments;
        return MaterialPageRoute(
          builder: (_) => WebScreen(
            url: typedArgs.url,
            isFromBottom: typedArgs.isFromBottom,
          ),
          settings: settings,
        );
      case Router.discoverScreen:
        return MaterialPageRoute(
          builder: (_) => DiscoverScreen(),
          settings: settings,
        );
      case Router.expandedImageView:
        if (hasInvalidArgs<ExpandedImageViewArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<ExpandedImageViewArguments>(args);
        }
        final typedArgs = args as ExpandedImageViewArguments;
        return MaterialPageRoute(
          builder: (_) => ExpandedImageView(
            image: typedArgs.image,
          ),
          settings: settings,
        );

      case Router.feedScreen:
        if (hasInvalidArgs<FeedScreenArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<FeedScreenArguments>(args);
        }
        final typedArgs = args as FeedScreenArguments;
        return MaterialPageRoute(
          builder: (_) => FeedScreen(
              key: typedArgs.key,
              articalIndex: typedArgs.articalIndex,
              articals: typedArgs.articals,
              isFromSearch: typedArgs.isFromSearch),
          settings: settings,
        );

      case Router.appBase:
        return MaterialPageRoute(
          builder: (_) => AppBase(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//FeedScreen arguments holder class
class FeedScreenArguments {
  final Key key;
  final int articalIndex;
  final List<Articles> articals;
  final bool isFromSearch;
  FeedScreenArguments(
      {this.key,
      @required this.articalIndex,
      @required this.articals,
      @required this.isFromSearch});
}

class ExpandedImageViewArguments {
  final String image;
  ExpandedImageViewArguments({
    @required this.image,
  });
}

class WebViewArguments {
  final String url;
  final bool isFromBottom;

  WebViewArguments({@required this.url, @required this.isFromBottom});
}

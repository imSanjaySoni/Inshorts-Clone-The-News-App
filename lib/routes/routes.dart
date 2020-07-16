import 'package:auto_route/auto_route_annotations.dart';
import 'package:inshort_clone/view/app_base/app_base.dart';
import 'package:inshort_clone/view/bookmarked_screen/bookmark.dart';
import 'package:inshort_clone/view/discover_screen/discover.dart';
import 'package:inshort_clone/view/feed_screen/feed.dart';
import 'package:inshort_clone/view/photo_view/photo_expanded_screen.dart';
import 'package:inshort_clone/view/search_screen/search.dart';
import 'package:inshort_clone/view/settings_screen/settings.dart';
import 'package:inshort_clone/view/web_screen/web.dart';

@autoRouter
class $Router {
  SearchScreen searchScreen;
  SettingsScreen settingsScreen;
  BookmarkScreen bookmarkScreen;
  WebScreen webScreen;
  DiscoverScreen discoverScreen;
  FeedScreen feedScreen;
  ExpandedImageView expandedView;
  @initial
  AppBase appBase;
}

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/bloc/feed/news_feed_state.dart';
import 'package:inshort_clone/common/loading_shorts.dart';
import 'package:inshort_clone/common/widgets/appbar.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:inshort_clone/view/feed_screen/feed.dart';
import 'package:inshort_clone/view/web_screen/web.dart';
import '../../aplication_localization.dart';

class AppBase extends StatefulWidget {
  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> with AutomaticKeepAliveClientMixin {
  int currentPage = 1;
  PageController _pageController;
  FeedProvider provider;

  @override
  void initState() {
    provider = Provider.of<FeedProvider>(context, listen: false);

    BlocProvider.of<NewsFeedBloc>(context)
      ..add(
        FetchNewsByCategoryEvent(category: "general"),
      );

    _pageController = PageController(
      initialPage: currentPage,
    );

    provider.setScreenController(_pageController);

    FeedController.getCurrentPage((page) {
      _pageController.jumpToPage(page);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<FeedProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: (page) {
                currentPage = _pageController.page.round();
                if (currentPage == 2) {
                  value.setAppBarVisible(false);
                } else {
                  value.setAppBarVisible(true);
                }
              },
              children: provider.getBaseScreenList,
            ),
            value.getAppBarVisible
                ? Align(
                    alignment: Alignment.topCenter,
                    child: CustomAppBar(
                      index: currentPage,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BuildNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    return BlocBuilder<NewsFeedBloc, NewsFeedState>(
      builder: (context, state) {
        if (state is NewsFeedInitialState) {
          return Container();
        } else if (state is NewsFeedLoadingState) {
          return LoadingShorts();
        } else if (state is NewsFeedLoadedState) {
          if (state.news.length == 0) {
            return Center(
              child: Text(
                "${AppLocalizations.of(context).translate('not_found')}\n",
                style: AppTextStyle.newsTitle,
              ),
            );
          }

          if (provider.webviwAdded == false) {
            provider.addWebScren(
              WebScreen(
                url: provider.getNewsURL,
                isFromBottom: false,
              ),
            );
          }

          return FeedScreen(
            isFromSearch: false,
            articalIndex: 0,
            articals: state.news,
          );
        } else if (state is NewsFeedErrorState) {
          provider.setDataLoaded(true);
          print(state.message);
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate('error'),
                  style: AppTextStyle.newsTitle,
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context).translate('error_message'),
                  style: AppTextStyle.searchbar,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

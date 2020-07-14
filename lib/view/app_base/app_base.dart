import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/bloc/feed/news_feed_state.dart';
import 'package:inshort_clone/common/loading_shorts.dart';
import 'package:inshort_clone/common/widgets/appbar.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:inshort_clone/view/discover_screen/discover.dart';
import 'package:inshort_clone/view/feed_screen/feed.dart';

class AppBase extends StatefulWidget {
  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> with AutomaticKeepAliveClientMixin {
  int currentPage = 1;
  bool visible = true;
  int articalIndex;
  bool hasDataLoaded = false;
  List<Widget> _pageItems;
  PageController _pageController;
  String title;

  @override
  void initState() {
    _pageItems = [
      DiscoverScreen(),
      buildNewsScreen(),
    ];

    BlocProvider.of<NewsFeedBloc>(context)
      ..add(
        FetchNewsByCategoryEvent(category: "general"),
      );

    FeedController.appBarStream.listen((event) {
      if (event != null) {
        setState(() {
          visible = event;
        });
      }
    });

    _pageController = PageController(
      initialPage: currentPage,
    );

    FeedController.getCurrentPage((page) {
      _pageController.jumpToPage(page);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                currentPage = _pageController.page.round();
                if (currentPage == 2) {
                  visible = false;
                } else {
                  visible = true;
                }
              });
            },
            children: _pageItems,
          ),
          appBar(),
        ],
      ),
    );
  }

  Widget appBar() {
    return !visible
        ? Container()
        : Align(
            alignment: Alignment.topCenter,
            child: CustomAppBar(
              index: currentPage,
              pageController: _pageController,
            ),
          );
  }

  Widget buildNewsScreen() {
    return BlocBuilder<NewsFeedBloc, NewsFeedState>(
      builder: (context, state) {
        if (state is NewsFeedInitialState) {
          return Container();
        } else if (state is NewsFeedLoadingState) {
          return LoadingShorts();
        } else if (state is NewsFeedLoadedState) {
          if (state.news.length == 0) {
            return Center(
              child: Text("Nothing Found ! \n"),
            );
          }

          return FeedScreen(
            isFromSearch: false,
            articalIndex: 0,
            articals: state.news,
          );
        } else if (state is NewsFeedErrorState) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: AppColor.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No Internet Connection!",
                  style: AppTextStyle.newsTitle,
                ),
                SizedBox(height: 8),
                Text(
                  "Please check your internet connection and retry",
                  style: AppTextStyle.searchbar,
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:inshort_clone/common/widgets/news_appbar.dart';
import 'package:inshort_clone/common/widgets/news_card/news_card.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  final List<Articles> articals;
  final int articalIndex;
  final bool isFromSearch;

  const FeedScreen(
      {Key key,
      @required this.articalIndex,
      @required this.articals,
      @required this.isFromSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: articalIndex);
    int lastPage = 0;
    final provider = Provider.of<FeedProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: (page) {
                if (page > lastPage) {
                  FeedController.appBarVisible(false);
                  provider.setSearchAppBarVisible(false);
                  provider.setAppBarVisible(false);
                } else {
                  provider.setSearchAppBarVisible(true);
                  FeedController.appBarVisible(true);
                  provider.setAppBarVisible(false);
                }
                lastPage = page;
                FeedController.curentArticalIndex(page);
                FeedController.hasFeedBottomActionBarVisible(false);
              },
              controller: _pageController,
              itemCount: articals.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return NewsCard(
                  articles: articals[index],
                  isFromSearch: isFromSearch,
                );
              },
            ),
            isFromSearch
                ? Consumer<FeedProvider>(
                    builder: (context, value, child) =>
                        value.searchAppBarVisible
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: NewsCardAppBar(),
                              )
                            : Container(),
                  )
                : Container()
          ],
        ));
  }
}

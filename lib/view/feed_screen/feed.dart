import 'package:flutter/material.dart';
import 'package:inshort_clone/common/widgets/news_appbar.dart';
import 'package:inshort_clone/common/widgets/news_card/news_card.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
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
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    PageController _pageController =
        PageController(initialPage: widget.articalIndex);

    int lastPage = 0;
    final provider = Provider.of<FeedProvider>(context, listen: false);

    provider.setfeedPageController(_pageController);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (page) {
              if (page > lastPage) {
                provider.setSearchAppBarVisible(false);
                provider.setAppBarVisible(false);
              } else {
                provider.setSearchAppBarVisible(true);

                provider.setAppBarVisible(true);
              }
              lastPage = page;
              provider.setCurentArticalIndex(page);
              provider.setFeedBottomActionbarVisible(false);
            },
            controller: _pageController,
            itemCount: widget.articals.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return NewsCard(
                articles: widget.articals[index],
                isFromSearch: widget.isFromSearch,
              );
            },
          ),
          widget.isFromSearch
              ? Consumer<FeedProvider>(
                  builder: (context, value, child) => value.searchAppBarVisible
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: NewsCardAppBar(),
                        )
                      : Container(),
                )
              : Container()
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

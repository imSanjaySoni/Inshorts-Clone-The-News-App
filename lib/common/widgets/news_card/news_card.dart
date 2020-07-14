import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/global/global.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'bottom_action_bar.dart';
import 'bottom_bar.dart';

class NewsCard extends StatefulWidget {
  final Articles articles;
  final bool isFromSearch;

  const NewsCard({Key key, this.articles, this.isFromSearch = false})
      : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard>
    with AutomaticKeepAliveClientMixin {
  GlobalKey _containerKey = GlobalKey();
  bool searchAppBarVisivle = true;
  bool isFeedBottomVisible = false;

  @override
  void initState() {
    FeedController.feedBottomActionBarStream.listen((event) {
      if (event != null) {
        setState(() {
          isFeedBottomVisible = event;
        });
      }
    });

    FeedController.searchFeedAppBarStream.listen((event) {
      setState(() {
        if (event != null) {
          searchAppBarVisivle = event;
        }
      });
    });
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  build(BuildContext context) {
    super.build(context);

    return InkWell(
      onTap: () {
        FeedController.appBarVisible(!searchAppBarVisivle);
        FeedController.searchFeedAppBarVisible(!searchAppBarVisivle);
        Provider.of<FeedProvider>(context, listen: false)
            .setSearchAppBarVisible(!searchAppBarVisivle);
        FeedController.hasFeedBottomActionBarVisible(!searchAppBarVisivle);
      },
      child: SafeArea(
        bottom: false,
        child: Stack(children: [
          _buildCard(context),
        ]),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: BoxConstraints(
          minHeight: Global.height(context),
          minWidth: double.maxFinite,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3),
        ),
        child: RepaintBoundary(
          key: _containerKey,
          child: Container(
            color: Colors.white,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.4,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      widget.articles.urlToImage != null
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColor.surface,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.articles.urlToImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              color: AppColor.surface,
                            ),
                      Positioned(
                        top: 0,
                        left: 0,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                      widget.articles.urlToImage != null
                          ? Center(
                              child: Image.network(
                                widget.articles.urlToImage,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.6,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.85,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.articles.title,
                                style: AppTextStyle.newsTitle,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.articles.description != null
                                    ? widget.articles.description
                                    : "",
                                style: AppTextStyle.newsSubtitle,
                                maxLines: 9,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "swipe left for more at the ${widget.articles.source.name} / ${DateFormat("MMMM d").format(
                                  DateTime.parse(widget.articles.publishedAt),
                                )}",
                                style: AppTextStyle.newsFooter,
                              )
                            ],
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.15,
                        child: BottomBar(
                          articles: widget.articles,
                        ),
                      ),
                      isFeedBottomVisible
                          ? FractionallySizedBox(
                              alignment: Alignment.bottomCenter,
                              heightFactor: 0.15,
                              child: BottomActionBar(
                                containerKey: _containerKey,
                              ))
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

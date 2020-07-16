import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/global/global.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'bottom_action_bar.dart';
import 'bottom_bar.dart';

class NewsCard extends StatelessWidget {
  final Articles articles;
  final bool isFromSearch;

  const NewsCard({Key key, this.articles, this.isFromSearch}) : super(key: key);

  @override
  build(BuildContext context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    provider.setNewsURL(articles.url);
    print(articles.url);

    return GestureDetector(
      onTap: () {
        provider.setAppBarVisible(!provider.getAppBarVisible);
        provider.setSearchAppBarVisible(!provider.getSearchAppBarVisible);
        provider.setFeedBottomActionbarVisible(
            !provider.getFeedBottomActionbarVisible);
      },
      child: SafeArea(
        bottom: false,
        child: _buildCard(context, provider),
      ),
    );
  }

  Widget _buildCard(BuildContext context, provider) {
    GlobalKey _containerKey = GlobalKey();

    return Consumer<FeedProvider>(builder: (context, value, _) {
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
                        articles.urlToImage != null
                            ? Container(
                                decoration: BoxDecoration(
                                  color: AppColor.surface,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      articles.urlToImage,
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
                        articles.urlToImage != null
                            ? GestureDetector(
                                onTap: () => Router.navigator.pushNamed(
                                    Router.expandedImageView,
                                    arguments: ExpandedImageViewArguments(
                                        image: articles.urlToImage)),
                                child: Center(
                                  child: Hero(
                                    tag: "photo",
                                    child: Image.network(
                                      articles.urlToImage,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
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
                                  articles.title,
                                  style: AppTextStyle.newsTitle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  articles.description != null
                                      ? articles.description
                                      : "",
                                  style: AppTextStyle.newsSubtitle,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "swipe left for more at the ${articles.source.name} / ${DateFormat("MMMM d").format(
                                    DateTime.parse(articles.publishedAt),
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
                            articles: articles,
                          ),
                        ),
                        value.getFeedBottomActionbarVisible
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
    });
  }
}

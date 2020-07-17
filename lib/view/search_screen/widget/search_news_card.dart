import 'package:flutter/material.dart';
import 'package:inshort_clone/global/global.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:intl/intl.dart';

class SearchNewsCard extends StatelessWidget {
  final List<Articles> articles;
  final int index;

  const SearchNewsCard({Key key, this.articles, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var article = articles[index];

    return GestureDetector(
      onTap: () => Router.navigator.pushNamed(
        Router.feedScreen,
        arguments: FeedScreenArguments(
            articalIndex: index, articals: articles, isFromSearch: true),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 16,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: Global.width(context) * 0.18,
              child: Row(
                children: <Widget>[
                  Container(
                    width: Global.width(context) * 0.18,
                    height: Global.width(context) * 0.18,
                    color: AppColor.surface,
                    child: article.urlToImage != null
                        ? Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                      child: Text(
                        article.title,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            // color: AppColor.onBackground,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        DateFormat("MMMM d").format(
                          DateTime.parse(article.publishedAt),
                        ),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Global.width(context) * 0.22,
              ),
              child: Divider(
                height: 1,
                color: AppColor.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}

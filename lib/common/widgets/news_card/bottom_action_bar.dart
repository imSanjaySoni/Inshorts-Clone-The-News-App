import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/services/news/offline_service.dart';
import 'package:inshort_clone/services/news/share_service.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';

import 'package:provider/provider.dart';

class BottomActionBar extends StatelessWidget {
  final containerKey;
  final Articles articles;

  const BottomActionBar({
    Key key,
    this.containerKey,
    this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          actionButton(
            title: "Share",
            icon: FeatherIcons.share2,
            onTap: () {
              Provider.of<FeedProvider>(context, listen: false)
                  .setWatermarkVisible(true);

              Future.delayed(Duration(seconds: 2),
                  () => convertWidgetToImageAndShare(context, containerKey));
            },
          ),
          WatchBoxBuilder(
            box: Hive.box<Articles>('bookmarks'),
            builder: (context, snap) => actionButton(
              title: "Bookmark",
              icon: snap.containsKey(articles.url)
                  ? Icons.bookmark
                  : FeatherIcons.bookmark,
              onTap: () {
                handleBookmarks(articles);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget actionButton({
    @required String title,
    @required IconData icon,
    @required Function onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: AppColor.accent,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: AppTextStyle.bottomActionbar,
          ),
        ],
      ),
    );
  }
}

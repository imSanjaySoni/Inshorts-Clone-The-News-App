import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/global/global.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final bool active;

  const CategoryCard(
      {Key key, this.icon, this.title, this.onTap, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        FeedController.addCurrentPage(1);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: Global.height(context) * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Opacity(
              opacity: active ? 1 : 0.5,
              child: Image.asset(
                "assets/icons/$icon.png",
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: active
                  ? AppTextStyle.categoryTitle.copyWith(
                      color: AppColor.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)
                  : AppTextStyle.categoryTitle,
            ),
          ],
        ),
      ),
    );
  }
}

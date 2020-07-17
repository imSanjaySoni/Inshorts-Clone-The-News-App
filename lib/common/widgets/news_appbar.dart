import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:provider/provider.dart';

class NewsCardAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        // color: Colors.white,
        child: Container(
          height: 52,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(FeatherIcons.chevronLeft),
                            color: AppColor.accent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Search",
                            style: AppTextStyle.appBarTitle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Consumer<FeedProvider>(
                    builder: (context, value, child) =>
                        value.getCurentArticalIndex != 0
                            ? IconButton(
                                icon: Icon(FeatherIcons.arrowUp),
                                onPressed: () {
                                  value.getfeedPageController.animateToPage(0,
                                      duration: Duration(milliseconds: 700),
                                      curve: Curves.easeInBack);
                                })
                            : Container(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

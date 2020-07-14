import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/global/global.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  final int index;
  final PageController pageController;
  const CustomAppBar({Key key, this.index = 1, this.pageController})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentArticalIndex;

  @override
  void initState() {
    FeedController.currentArticalStream.listen((event) {
      if (event != null) {
        setState(() {
          _currentArticalIndex = event;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProvider>(
      builder: (context, value, child) => SafeArea(
        child: Material(
          color: Colors.white,
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
                      child: widget.index != 1
                          ? IconButton(
                              icon: Icon(
                                FeatherIcons.settings,
                                color: AppColor.accent,
                              ),
                              onPressed: () {
                                Router.navigator
                                    .pushNamed(Router.settingsScreen);
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(FeatherIcons.chevronLeft),
                                  color: AppColor.accent,
                                  onPressed: () {
                                    FeedController.addCurrentPage(0);
                                  },
                                ),
                                Text(
                                  "Discover",
                                  style: AppTextStyle.appBarTitle,
                                )
                              ],
                            ),
                    )),
                    Expanded(
                      child: Text(
                        widget.index == 1
                            ? value.appBarTitle != null
                                ? value.appBarTitle
                                : "My Feed"
                            : "Discover",
                        style: AppTextStyle.appBarTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            widget.index != 1
                                ? Text(
                                    value.appBarTitle != null
                                        ? value.appBarTitle
                                        : "My Feed",
                                    style: AppTextStyle.appBarTitle,
                                  )
                                : Container(),
                            IconButton(
                              icon: Icon(
                                widget.index != 1
                                    ? FeatherIcons.chevronRight
                                    : value.hasDataLoaded
                                        ? _currentArticalIndex == null
                                            ? FeatherIcons.rotateCw
                                            : FeatherIcons.arrowUp
                                        : FeatherIcons.loader,
                                color: AppColor.accent,
                              ),
                              onPressed: () {
                                if (!value.hasDataLoaded) {
                                  return null;
                                } else if (_currentArticalIndex != null &&
                                    _currentArticalIndex > 0) {
                                  bringToTop(widget.pageController);
                                } else {
                                  print("Refresh");
                                }
                                print(value.hasDataLoaded);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: Global.width(context) * 0.1,
                  height: 3,
                  color: AppColor.accent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bringToTop(PageController pageController) {
    pageController.jumpToPage(0);
  }
}

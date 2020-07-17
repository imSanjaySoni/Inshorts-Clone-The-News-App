import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/style/colors.dart';

appSearchBar() {
  return PreferredSize(
    child: Material(
      elevation: 1,
      // color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Router.navigator.pushNamed(Router.searchScreen);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 98, 16, 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FeatherIcons.search,
                color: AppColor.iconGrey,
              ),
              SizedBox(width: 16),
              Text(
                "Search for news",
                style: TextStyle(
                  color: AppColor.iconGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(142),
  );
}

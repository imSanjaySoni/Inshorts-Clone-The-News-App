import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        iconTheme: IconThemeData(color: AppColor.grey3),
        backgroundColor: AppColor.background,
        brightness: Brightness.dark,
        title: Text(
          "Options",
          style: AppTextStyle.appBarTitle.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          // Container(
          //   color: AppColor.accent,
          //   padding: const EdgeInsets.all(16),
          //   child: Column(
          //     children: <Widget>[
          //       Text("Save Your Prefrences"),
          //       Text("Sign in to save your Likes and Bookmarks"),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           RaisedButton(
          //             onPressed: () {},
          //             child: Text("Sign in"),
          //           ),
          //           Row(
          //             children: <Widget>[
          //               IconButton(
          //                 icon: Icon(FeatherIcons.facebook),
          //                 onPressed: () {},
          //               ),
          //               IconButton(
          //                 icon: Icon(FeatherIcons.github),
          //                 onPressed: () {},
          //               ),
          //               IconButton(
          //                 icon: Icon(FeatherIcons.twitter),
          //                 onPressed: () {},
          //               ),
          //             ],
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          ListTile(
            leading: Icon(FeatherIcons.sunset),
            title: Text("Night Mode"),
            subtitle: Text("For better readability at night"),
            trailing: Switch(value: false, onChanged: (v) {}),
          ),
        ],
      ),
    );
  }
}

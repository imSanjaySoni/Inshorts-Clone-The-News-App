import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/theme.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Options",
          style: AppTextStyle.appBarTitle.copyWith(
            fontSize: 18,
            color:
                Provider.of<ThemeProvider>(context, listen: false).isDarkThemeOn
                    ? AppColor.background
                    : AppColor.onBackground,
          ),
        ),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(FeatherIcons.sunset),
              title: Text("Night Mode"),
              subtitle: Text("For better readability at night"),
              onTap: () {
                themeProvider.darkTheme(!themeProvider.isDarkThemeOn);
              },
              trailing: Switch(
                  activeColor: AppColor.accent,
                  value: themeProvider.isDarkThemeOn,
                  onChanged: (status) {
                    themeProvider.darkTheme(status);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static final TextStyle appBarTitle = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle newsTitle = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle newsSubtitle = TextStyle(
    // color: AppColor.grey2,
    fontSize: 15,
    height: 1.5,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle newsFooter = TextStyle(
    color: AppColor.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle newsBottomTitle = TextStyle(
    color: AppColor.onPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle newsBottomSubtitle = TextStyle(
    color: AppColor.onPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle headline = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle topiccardTitle = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle categoryTitle = TextStyle(
    color: AppColor.iconGrey,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle searchbar = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle bottomActionbar = TextStyle(
    color: AppColor.iconGrey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle loading = TextStyle(
    // color: AppColor.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

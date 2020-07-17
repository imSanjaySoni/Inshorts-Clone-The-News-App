import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'dart:ui' as ui;

class BottomActionBar extends StatelessWidget {
  final containerKey;

  const BottomActionBar({Key key, this.containerKey}) : super(key: key);

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
              _convertWidgetToImageAndShare();
            },
          ),
          actionButton(
            title: "Bookmark",
            icon: FeatherIcons.bookmark,
            onTap: () {
              print("bookmarked");
            },
          )
        ],
      ),
    );
  }

  void _convertWidgetToImageAndShare() async {
    RenderRepaintBoundary renderRepaintBoundary =
        containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8List = byteData.buffer.asUint8List();
    try {
      await Share.file('imsanjaysoni/InshortClone', 'InshortClone.png',
          uInt8List, 'image/png',
          text: 'My optional text.');
    } catch (e) {
      print('error: $e');
    }
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

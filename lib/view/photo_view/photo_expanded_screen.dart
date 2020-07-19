import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ExpandedImageView extends StatelessWidget {
  final image;

  ExpandedImageView({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoView(
                imageProvider: NetworkImage(image),
                // heroAttributes: PhotoViewHeroAttributes(
                //   transitionOnUserGestures: true,
                // ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      FeatherIcons.x,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

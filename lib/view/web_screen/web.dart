import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final String url;
  WebScreen(this.url);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          widget.url.split("/")[2],
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          loading
              ? SizedBox(height: 3, child: LinearProgressIndicator())
              : Container(),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (d) {
                setState(() {
                  loading = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final String url;
  final bool isFromBottom;
  final PageController pageController;

  WebScreen(
      {@required this.url, @required this.isFromBottom, this.pageController});

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  bool loading = true;

  final Completer<WebViewController> _webViewController =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    String url = Provider.of<FeedProvider>(context, listen: false).getNewsURL;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () {
              widget.isFromBottom
                  ? Navigator.pop(context)
                  : widget.pageController != null
                      ? widget.pageController.jumpToPage(0)
                      : FeedController.addCurrentPage(1);
            }),
        actions: <Widget>[
          FutureBuilder<WebViewController>(
              future: _webViewController.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> snapshot) {
                final bool webViewReady =
                    snapshot.connectionState == ConnectionState.done;
                final WebViewController controller = snapshot.data;
                return IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: !webViewReady
                      ? null
                      : () {
                          setState(() {
                            loading = true;
                          });
                          controller.reload();
                        },
                );
              }),
        ],
        title: Text(
          url.split("/")[2],
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
              initialUrl: url,
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onPageFinished: (d) {
                setState(() {
                  loading = false;
                });
              },
              onWebViewCreated: (WebViewController webViewController) {
                _webViewController.complete(webViewController);
              },
            ),
          ),
        ],
      ),
    );
  }
}

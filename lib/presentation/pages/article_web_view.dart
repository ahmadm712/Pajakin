import 'package:flutter/material.dart';
import 'package:pajakin/presentation/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleWebView extends StatelessWidget {
  final String url;

   const ArticleWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

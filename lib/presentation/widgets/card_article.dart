import 'package:flutter/material.dart';
import 'package:pajakin/data/models/article.dart';
import 'package:pajakin/utils/routes.dart';

import '../../utils/global_function.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({Key? key, required this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.DETAIL_BERITA_PAGE,
              arguments: article);
        },
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
          leading: Hero(
            tag: article.urlToImage!,
            child: Image.network(
              article.urlToImage!,
              width: 100,
            ),
          ),
          title: Text(
            article.title,
            style: GlobalFunctions.textTheme(context: context)
                .headline6!
                .copyWith(color: Colors.white, fontSize: 16),
          ),
          subtitle: Text(article.author ?? "",
              style: GlobalFunctions.textTheme(context: context)
                  .subtitle1!
                  .copyWith(color: Colors.white, fontSize: 14)),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pajakin/data/models/article.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.blueAccent,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    article.urlToImage!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.description ?? "-",
                        style: GlobalFunctions.textTheme(context: context)
                            .bodyText2!
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      const Divider(color: Colors.grey),
                      Text(
                        article.title,
                        style: GlobalFunctions.textTheme(context: context)
                            .headline6!
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      const Divider(color: Colors.grey),
                      Text(
                        'Date: ${article.publishedAt}',
                        style: GlobalFunctions.textTheme(context: context)
                            .caption!
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Author: ${article.author}',
                        style: GlobalFunctions.textTheme(context: context)
                            .caption!
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      const Divider(color: Colors.grey),
                      Text(
                        article.content ?? "-",
                        style: GlobalFunctions.textTheme(context: context)
                            .bodyText1!
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          child: Text(
                            'Read more',
                            style: GlobalFunctions.textTheme(context: context)
                                .button!
                                .copyWith(color: Colors.black, fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                Routes.WEB_VIEW_PAGE, article.url);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

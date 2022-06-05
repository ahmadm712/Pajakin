import 'package:pajakin/data/services/api_services.dart';
import 'package:pajakin/presentation/providers/news_provider.dart';
import 'package:pajakin/presentation/widgets/card_article.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:pajakin/utils/state_result.dart';

import '../../utils/constans.dart';
import '../../utils/global_function.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<NewsProvider>(
          builder: (context, state, _) {
            if (state.state == StateResult.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == StateResult.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.articles.length,
                itemBuilder: (context, index) {
                  var article = state.result.articles[index];
                  return CardArticle(article: article);
                },
              );
            } else if (state.state == StateResult.noData) {
              return Center(child: Text(state.message));
            } else if (state.state == StateResult.error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text(''));
            }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              '${assetIcons}icon-back(1).png',
              scale: 1.6,
              height: 25,
              width: 25,
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 16.0,
              top: 16.0,
              bottom: 6.0,
            ),
            child: Text(
              'Berita Terbaru Seputar Bisnis',
              style: GlobalFunctions.textTheme(context: context)
                  .headline6!
                  .copyWith(color: Colors.white, fontSize: 20),
            ),
          ),
          Flexible(child: _buildList())
        ]));
  }
}

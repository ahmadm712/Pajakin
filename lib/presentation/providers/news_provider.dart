import 'package:flutter/material.dart';
import '../../data/models/article.dart';
import '../../data/services/api_services.dart';
import '../../utils/state_result.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService apiService;

  NewsProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late ArticlesResult _articlesResult;
  late StateResult _state;
  String _message = '';

  String get message => _message;

  ArticlesResult get result => _articlesResult;

  StateResult get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = StateResult.loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.articles.isEmpty) {
        _state = StateResult.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = StateResult.hasData;
        notifyListeners();
        return _articlesResult = article;
      }
    } catch (e) {
      _state = StateResult.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

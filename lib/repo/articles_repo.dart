import '../Data/model/ArticlesResponse/ArticlesResponse.dart';

abstract class ArticlesRepo {
  Future<ArticlesResponse> getArticles (String sourceId);

}
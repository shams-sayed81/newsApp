import 'package:injectable/injectable.dart';
import 'package:new_app/Data/dataSource/articles_data_source.dart';
import 'package:new_app/Data/model/ArticlesResponse/ArticlesResponse.dart';

import '../../repo/articles_repo.dart';
@Injectable(as: ArticlesRepo)
class ArticlesRepoImpl extends ArticlesRepo{
  ArticlesDataSource articlesDataSource;
  @factoryMethod
  ArticlesRepoImpl(this.articlesDataSource);
  @override
  Future<ArticlesResponse> getArticles(String sourceId)  {
   return articlesDataSource.getArticles(sourceId);
  }
}
import 'package:injectable/injectable.dart';
import 'package:new_app/Data/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:new_app/core/remote/api_manager.dart';

import '../dataSource/articles_data_source.dart';
@Injectable(as:ArticlesDataSource )
class ArticlesDataSourceImpl extends ArticlesDataSource{
  ApiManager apiManager;
  @factoryMethod
  ArticlesDataSourceImpl(this.apiManager);
  @override
  Future<ArticlesResponse> getArticles(String sourceId) {
   return apiManager.getArticle(sourceId);
  }

}
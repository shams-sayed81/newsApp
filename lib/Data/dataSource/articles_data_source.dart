import 'package:new_app/Data/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:new_app/core/remote/api_manager.dart';



abstract class ArticlesDataSource {
Future<ArticlesResponse> getArticles (String sourceId);
}
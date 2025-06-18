import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/remote/api_manager.dart';

class ArticlesViewModel extends Cubit<ArticleStates> {
  ArticlesViewModel() : super(ArticleLoadingState());
  getSources(String id) async {
    var response = await ApiManager.getArticle(id);
    emit(ArticleLoadingState());
    try {
      if (response.status == 'error') {
        emit(ArticleErrorState(response.message!));
      } else {
        if (response.articles?.isNotEmpty ?? false) {
          emit(ArticleSuccessState(response.articles ?? []));
        } else {
          emit(EmptyState());
        }
      }
    } catch (e) {
      emit(ArticleErrorState(e.toString()));
    }
  }
}

abstract class ArticleStates {}

class ArticleErrorState extends ArticleStates {
  String msg;
  ArticleErrorState(this.msg);
}

class ArticleLoadingState extends ArticleStates {}

class EmptyState extends ArticleStates {}

class ArticleSuccessState extends ArticleStates {
  List articles;
  ArticleSuccessState(this.articles);
}

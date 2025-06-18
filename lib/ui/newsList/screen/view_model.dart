import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/remote/api_manager.dart';

class ViewModel extends Cubit<NewsStates>{
  ViewModel():super(NewsLoadingState());
  getSources (String id)async{
    var response =await ApiManager.getSources(id);
    emit(NewsLoadingState());
     try {
       if (response?.status=='error'){
         emit(NewsErrorState(response!.message!));
       }

       else {
         emit(NewsSuccessState(response?.sources??[]));
       }
     }catch (e) {
      emit(NewsErrorState(e.toString()));
     }
    }
  }


abstract class NewsStates {}
class NewsErrorState extends NewsStates {
  String msg;
  NewsErrorState(this.msg);
}
class NewsLoadingState extends NewsStates {

}
class NewsSuccessState extends NewsStates {
  List sources ;
  NewsSuccessState (this.sources);
}


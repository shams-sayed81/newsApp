import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/core/remote/constants.dart';
import 'package:new_app/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:new_app/model/SourcesResponses/SourcesResponses.dart';

class ApiManager {

  static Future<SourcesResponses?> getSources(String category) async {
    Uri uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      "apiKey": apikey,
      "category": category
    });

    var response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponses sourcesResponses = SourcesResponses.fromJson(json);
    return sourcesResponses;
  }


  static Future<ArticlesResponse> getArticle(String source)async{
    //https://newsapi.org/v2/everything?apiKey=3f3c96cff1704d04a75faf559f38432d&sources=the-verge
    Uri uri =Uri.https(baseUrl , "/v2/everything" , {
      "apiKey": apikey,
       "sources" : source
    });
    var response =await http.get(uri);
    Map<String,dynamic> json = jsonDecode(response.body);
    ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);
    return articlesResponse ;


  }
}
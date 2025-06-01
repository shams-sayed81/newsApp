import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/remote/api_manager.dart';
import 'package:new_app/model/ArticlesResponse/ArticlesResponse.dart';
import 'package:new_app/model/SourcesResponses/Sources.dart';
import 'package:new_app/ui/newsList/widgets/article_item.dart';

import '../../../core/colors_manager.dart';

class ArticleWidget extends StatefulWidget {
 final Source source;
  const ArticleWidget({super.key , required this.source});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <ArticlesResponse?>(future: ApiManager.getArticle(widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorsManager.tertiary,
            ),
          );
        }
        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(snapshot.error.toString())),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        var response = snapshot.data;
        if (response?.status == 'error') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(response?.message ?? 'Something went wrong'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child:const Text('Try Again'),
                ),
              ],
            ),
          );
        }
        final articles = response?.articles ?? [];

        return ListView.separated(
           itemBuilder: (context, index) => ArticleItem(article: articles[index], ),
           separatorBuilder: (context, index) => SizedBox(height: 16.h,),
           itemCount: articles.length);
    },);
  }
}



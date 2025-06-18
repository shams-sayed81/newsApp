import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/model/SourcesResponses/Sources.dart';
import 'package:new_app/ui/newsList/widgets/article_item.dart';
import 'package:new_app/ui/newsList/widgets/view_model.dart';

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
    return BlocProvider(create: (context) => ArticlesViewModel()..getSources(widget.source.id!),
    child: BlocBuilder<ArticlesViewModel , ArticleStates>(builder: (context, state) {

      if (state is ArticleLoadingState){
        return Center(
          child: CircularProgressIndicator(
            color: ColorsManager.tertiary,
          ),
        );
      }
      else if (state is ArticleErrorState){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(state.msg)),
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
      else if (state is EmptyState){
        return Center(child: Text('No Articles Found ' ,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25),),);
      }

      else {
        var articles = (state as ArticleSuccessState).articles;
        return ListView.separated(
            itemBuilder: (context, index) => ArticleItem(article: articles[index], ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h,),
            itemCount: articles.length);
      }

    },),
    );
  }
}

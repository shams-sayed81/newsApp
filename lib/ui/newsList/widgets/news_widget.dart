import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/ui/newsList/widgets/article_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>const ArticleItem(),
        separatorBuilder: (context, index) => SizedBox(height: 16.h,),
        itemCount: 5);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_app/model/ArticlesResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import '../../../core/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context, builder:  (context) =>  AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          contentPadding: REdgeInsets.all(8),
          insetPadding:  EdgeInsets.zero,
          alignment: Alignment.bottomCenter,

          content:  SizedBox(

         width: ScreenUtil().screenWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                    child: CachedNetworkImage(imageUrl: article.urlToImage??''),),
                SizedBox(
                  height: 8.h,
                ),
                Text(article.description??'' , maxLines: 4,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(
                  height: 8.h,
                ),
                ElevatedButton(onPressed: ()async{
                  final Uri url = Uri.parse(article.url??'');

                  await launchUrl(url);
                }, child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('View Full Article ' ,

                    style: Theme.of(context).textTheme.bodyMedium,),
                )),



              ],
            ),

          ),

        ),
        );
      },
      child: Container(
        margin: REdgeInsets.all(16),
        padding: REdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                height: 220.h,
                fit: BoxFit.fill,
                width: double.infinity,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.tertiary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error_outline,
                  size: 50.sp,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              article.title??'',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 17.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex:4,
                  child: Text('By: ${article.author}',
                    style:  TextStyle(
                    color: ColorsManager.tertiary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ), ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DateTime.now().difference(DateTime.parse(article.publishedAt??'')).inDays<2 ?
                    timeago.format(DateTime.parse(article.publishedAt??'')):
                     article.publishedAt??'',
                    style:  TextStyle(
                      color: ColorsManager.tertiary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

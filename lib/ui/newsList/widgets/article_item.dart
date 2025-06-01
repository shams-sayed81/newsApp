import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/colors_manager.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl:
                  'https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg',
              height: 220.h,
              fit: BoxFit.fill,
              width: double.infinity,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.tertiary,
                ),
              ),
              errorWidget: (context, url, error) =>  Icon(
                Icons.error_outline,
                size: 50.sp,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Text(
            'data',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: 10.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('data' ), Text('data')],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/CategoryModel.dart';
import '../../home/widgets/category.dart';

class CategoriesList extends StatelessWidget {
  void Function () onCategoryTap ;
   CategoriesList({ required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.only(top: 15.sp, right: 15.sp,left: 15.sp),
      child:   Column(
        children: [
          Text('''Good Morning
Here is Some News For You''', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500), ),

          SizedBox(height: 16.h,) ,
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) =>  Category(categoryModel: CategoryModel.categoryList[index], onCategoryTap:onCategoryTap ,),
                separatorBuilder: (context, index) => const SizedBox(height: 16,), itemCount: CategoryModel.categoryList.length),
          )
        ],
      ),
    );
  }
}

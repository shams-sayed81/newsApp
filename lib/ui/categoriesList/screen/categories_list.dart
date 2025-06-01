import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/strings_manager.dart';

import '../../../model/CategoryModel.dart';
import '../../home/widgets/category.dart';

class CategoriesList extends StatelessWidget {
 final void Function (CategoryModel) onCategoryTap ;
  const CategoriesList({super.key,  required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategoryList();

    return SafeArea(
      child: Padding(
        padding:  REdgeInsets.only( top: 15.sp, right: 15.sp,left: 15.sp),
        child:   Column(
          children: [
            Text(StringsManager.welcomeMessage.tr(),
              style: Theme.of(context).textTheme.headlineLarge ),

            SizedBox(height: 16.h,) ,
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>  Category(categoryModel: categories[index], onCategoryTap:onCategoryTap,),
                  separatorBuilder: (context, index) => const SizedBox(height: 16,), itemCount: categories.length),
            )
          ],
        ),
      ),
    );
  }
}

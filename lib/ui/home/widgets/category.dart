import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/model/CategoryModel.dart';

import '../../../core/colors_manager.dart';

class Category extends StatelessWidget {
 final CategoryModel categoryModel;
  final void Function (CategoryModel) onCategoryTap ;
  const Category({super.key, required this.categoryModel ,
    required this.onCategoryTap});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: categoryModel.direction,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 198.h,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(24.r)),
        child: Row(
          children: [
            Image.asset(
              categoryModel.url,
              fit: BoxFit.cover,
              height: 198.h,
              width: 150.w,
            ),
            Padding(
              padding:  REdgeInsets.symmetric(vertical: 20.sp ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryModel.heading,
                    style: TextStyle(
                        fontSize: 26.r,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.secondary),
                  ),

                  ElevatedButton(onPressed: (){

                onCategoryTap(categoryModel);
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.tertiary,
                        padding: EdgeInsets.zero
                      ) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  REdgeInsetsDirectional.all( 8),
                            child: Text('View All' ,  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500 ,
                            ),),
                          ),
                          CircleAvatar(
                             backgroundColor: Theme.of(context).colorScheme.secondary,
                             radius: 30,
                             child: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary))
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

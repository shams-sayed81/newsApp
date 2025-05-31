import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/appStyle.dart';
import 'package:new_app/model/CategoryModel.dart';

class Category extends StatelessWidget {
  CategoryModel categoryModel;
   void Function () onCategoryTap ;
   Category({required this.categoryModel , required this.onCategoryTap});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: categoryModel.direction,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: 198.h,
        decoration: BoxDecoration(
            color: const Color(0xff121212),
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
                        color: Colors.white),
                  ),

                  ElevatedButton(onPressed: (){

                onCategoryTap();
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.zero
                      ) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  REdgeInsetsDirectional.all( 8),
                            child: Text('View All' ,  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500 ,color: Colors.black),),
                          ),
                         const CircleAvatar(
                             backgroundColor: Colors.white,
                             radius: 30,
                             child: Icon(Icons.arrow_forward_ios, color: Colors.black,))
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

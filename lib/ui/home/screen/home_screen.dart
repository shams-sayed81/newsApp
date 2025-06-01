import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/core/assets_manager.dart';
import 'package:new_app/core/strings_manager.dart';
import 'package:new_app/model/CategoryModel.dart';
import 'package:new_app/ui/home/widgets/drawer.dart';
import 'package:new_app/ui/newsList/screen/news_list.dart';

import '../../categoriesList/screen/categories_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  bool isShowNews =false;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  HomeDrawer(
        backHome: (){
          setState(() {
            isShowNews =false;
            selectedCategory =null;
            Navigator.pop(context);
          });
        },
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: Text(selectedCategory ==null ?
        StringsManager.homeTitle.tr() :
        selectedCategory!.heading),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AssetsManager.search,
                colorFilter: ColorFilter.mode( Theme.of(context).colorScheme.primary ,
                    BlendMode.srcIn ),
                height: 24.h,
                width: 24.w,
              )),
        ],
      ),

      body: isShowNews? NewsList(categoryModel: selectedCategory!,):
      CategoriesList(onCategoryTap: onCategorySelected)
    );
  }

   onCategorySelected (CategoryModel category){
  setState(() {
    isShowNews =true;
    selectedCategory =category;
  });
  }
}

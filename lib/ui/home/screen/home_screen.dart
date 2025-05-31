import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/model/CategoryModel.dart';
import 'package:new_app/ui/home/widgets/category.dart';
import 'package:new_app/ui/home/widgets/drawer.dart';

import '../../categoriesList/screen/categoriesList.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'lib/assets/images/Search.svg',
                height: 24.h,
                width: 24.w,
              )),
        ],
      ),

      body:CategoriesList(onCategoryTap: (){},)
    );
  }
}

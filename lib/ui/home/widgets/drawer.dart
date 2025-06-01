import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../provider/theme_provider.dart';

class HomeDrawer extends StatefulWidget {
  final void Function() backHome;
  const HomeDrawer({super.key, required this.backHome});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedLang = 'en';
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      backgroundColor: ColorsManager.primary,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.secondary,
            child: Center(
                child: Text(
              'News App',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.primary),
            )),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    widget.backHome();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetsManager.home,
                        height: 24.h,
                        width: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text('Go To Home',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.secondary)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(color: ColorsManager.secondary, thickness: 1.2),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.theme,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text('Theme',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20.sp),),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration:const InputDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        hint: Text('Choose Theme : ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorsManager.secondary)),
                        value: themeProvider.currentTheme,
                        dropdownColor: ColorsManager.primary,
                        isExpanded: true,
                        iconDisabledColor: ColorsManager.secondary,
                        iconEnabledColor: ColorsManager.secondary,
                        style: TextStyle(color: ColorsManager.secondary),
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text("Light"),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text("Dark"),
                          ),
                        ],
                        onChanged: (ThemeMode? value) {
                          if (value != null) {
                            themeProvider.changeTheme(value);
                            setState(() {});
                          }
                        }),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(color: ColorsManager.secondary, thickness: 1.2),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.world,
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Language ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: const InputDecoration(),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        hint: Text('Choose Language : ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        value: selectedLang,
                        dropdownColor: ColorsManager.primary,
                        isExpanded: true,
                        iconDisabledColor: ColorsManager.secondary,
                        iconEnabledColor: ColorsManager.secondary,
                        style: TextStyle(color: ColorsManager.secondary),
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text("English"),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text("Arabic"),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              selectedLang = value;
                            });
                            context.setLocale(Locale(value));
                          }
                        }),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(color: ColorsManager.secondary, thickness: 1.2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

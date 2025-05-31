import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/core/appStyle.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme ='light';
  String selectedLang ='en';
  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            color: Colors.white,
            child: const Center(
                child: Text(
              'News App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/Home.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('Go To Home',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(color: Colors.white, thickness: 1.2),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/theme.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('Theme',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(color: Colors.white)
                    )
                  ),
                  child: DropdownButtonHideUnderline(

                    child: DropdownButton(
                      hint: const Text('Choose Theme : '  ,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                      value: selectedTheme,
                      dropdownColor: Colors.black,
                      isExpanded: true,
                      iconDisabledColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      items: const [
                      DropdownMenuItem(
                        value: 'light',
                        child: Text("Light"),
                      ),
                      DropdownMenuItem(
                        value: 'dark',
                        child: Text("Dark"),
                      ),
                    ], onChanged: (value) {
                        setState(() {
                          selectedTheme =value!;
                        });
                    }),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(color: Colors.white, thickness: 1.2),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/world.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    const Text('Language ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(color: Colors.white)
                      )
                  ),
                  child: DropdownButtonHideUnderline(

                    child: DropdownButton(
                        hint: const Text('Choose Language : '  ,style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                        value: selectedLang,
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(
                            color: Colors.white
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text("English"),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text("Arabic"),
                          ),
                        ], onChanged: (value) {
                      setState(() {
                        selectedLang =value!;
                      });
                    }),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(color: Colors.white, thickness: 1.2),
              ],
            ),
          )
        ],
      ),
    );
  }
}

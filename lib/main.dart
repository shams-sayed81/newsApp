import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/app_style.dart';
import 'package:new_app/provider/theme_provider.dart';
import 'package:new_app/ui/categoriesList/screen/categories_list.dart';
import 'package:new_app/ui/home/screen/home_screen.dart';
import 'package:new_app/ui/newsList/screen/news_list.dart';
import 'package:new_app/ui/newsList/widgets/article_item.dart';
import 'package:provider/provider.dart';

import 'core/prefs_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await PrefsHelper.init();

  await ScreenUtil.ensureScreenSize();
  runApp(
      EasyLocalization(
          supportedLocales: const[Locale('en'), Locale('ar')],
          path: 'lib/assets/translations',
          fallbackLocale:const Locale('en'),
          child: ChangeNotifierProvider(

              create: (context)=> ThemeProvider()..initTheme(),

              child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.currentTheme,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          routes: {
            HomeScreen.routeName: (_) => HomeScreen(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}

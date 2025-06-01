
import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:new_app/core/strings_manager.dart';

class CategoryModel {
  String id;
  String heading;
  String url;
  ui.TextDirection direction;
  CategoryModel ({ this.direction=ui.TextDirection.ltr,required this.heading , required this.id , required this.url});

  static List<CategoryModel> getCategoryList() {
    return [
      CategoryModel(
          heading: StringsManager.categoryGeneral.tr(),
          id: 'general',
          url: 'lib/assets/images/general.png'),
      CategoryModel(
          heading: StringsManager.categoryBusiness.tr(),
          id: 'business',
          url: 'lib/assets/images/bussiness.png',
          direction: ui.TextDirection.rtl),
      CategoryModel(
          heading: StringsManager.categorySports.tr(),
          id: 'sports',
          url: 'lib/assets/images/sports.png'),
      CategoryModel(
          heading: StringsManager.categoryHealth.tr(),
          id: 'health',
          url: 'lib/assets/images/health.png',
          direction: ui.TextDirection.rtl),
      CategoryModel(
          heading: StringsManager.categoryScience.tr(),
          id: 'science',
          url: 'lib/assets/images/science.png'),
      CategoryModel(
          heading: StringsManager.categoryTechnology.tr(),
          id: 'technology',
          url: 'lib/assets/images/tech.png',
          direction: ui.TextDirection.rtl),
      CategoryModel(
          heading: StringsManager.categoryEntertainment.tr(),
          id: 'entertainment',
          url: 'lib/assets/images/enter.png'),
    ];
  }
}
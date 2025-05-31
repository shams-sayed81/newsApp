
import 'dart:ui';

class CategoryModel {
  String id;
  String heading;
  String url;
  TextDirection direction;
  CategoryModel ({ this.direction=TextDirection.ltr ,required this.heading , required this.id , required this.url});


  static List<CategoryModel> categoryList =[
    CategoryModel(heading: 'General', id: 'general', url: 'lib/assets/images/general.png'),
    CategoryModel(heading: 'Business', id: 'business', url: 'lib/assets/images/bussiness.png', direction: TextDirection.rtl),
    CategoryModel(heading: 'Sports', id: 'sports', url: 'lib/assets/images/sports.png'),
    CategoryModel(heading: 'Health', id: 'id', url: 'lib/assets/images/health.png', direction: TextDirection.rtl),
    CategoryModel(heading: 'Science', id: 'id', url: 'lib/assets/images/science.png'),
    CategoryModel(heading: 'Technology', id: 'id', url:'lib/assets/images/tech.png' , direction: TextDirection.rtl),
    CategoryModel(heading: 'Entertainment', id: 'id', url:'lib/assets/images/enter.png' ),

  ];
}
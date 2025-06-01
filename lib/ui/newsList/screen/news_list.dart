import 'package:flutter/material.dart';

import '../../../core/colors_manager.dart';
import '../widgets/news_widget.dart';

class NewsList extends StatelessWidget {
  static const String routeName = 'homeScreen';

  const NewsList({super.key});

  static const List <String> sources =[
    'ABC news',
    'ABC news',
    'ABC news',
    'CBB',
    'CBC',
    'CBC',
    'CBC',
    'CBC',

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
      tabAlignment:TabAlignment.start ,
      dividerHeight: 0,
      indicatorColor: ColorsManager.primary,
      tabs:
      sources.map((source) => Tab(
        text: source,
      )).toList()
          ),

          Expanded(child: TabBarView(children: sources.map((e)=>
              const NewsWidget () ).toList()  )),
        ],

      ),
    );
  }
}

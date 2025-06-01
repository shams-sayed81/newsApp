import 'package:flutter/material.dart';
import 'package:new_app/model/SourcesResponses/SourcesResponses.dart';
import 'package:new_app/ui/newsList/widgets/article_item.dart';
import '../../../core/colors_manager.dart';
import '../../../core/remote/api_manager.dart';
import '../../../model/CategoryModel.dart';
import '../widgets/articles_list.dart';

class NewsList extends StatefulWidget {
  final CategoryModel categoryModel;

  const NewsList({super.key, required this.categoryModel});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponses?>(
      future: ApiManager.getSources(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorsManager.tertiary,
            ),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(snapshot.error.toString())),
               const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        final response = snapshot.data;

        if (response?.status == 'error') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(response?.message ?? 'Something went wrong'),
               const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {

                    });
                  },
                  child:const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        final sources = response?.sources ?? [];
  
        return DefaultTabController(
          length: sources.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                indicatorColor: ColorsManager.primary,
                tabs: sources.map((source) => Tab(text: source.name)).toList(),
              ),
              Expanded(
                child: TabBarView(children: sources.map((source)=>  ArticleWidget(source: source)).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

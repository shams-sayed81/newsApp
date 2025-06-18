import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/ui/newsList/screen/view_model.dart';
import '../../../core/colors_manager.dart';
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
    return BlocProvider(create: (context) => ViewModel()..getSources(widget.categoryModel.id),
    child: BlocBuilder<ViewModel ,NewsStates>(
      builder: (context, state) {
      if (state is NewsLoadingState){
        return Center(
          child: CircularProgressIndicator(
            color: ColorsManager.tertiary,
          ),
        );
      }
      else if (state is NewsErrorState){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(state.msg)),
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
      }else {
        var sources = (state as NewsSuccessState).sources;
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
      }
    },),
    );
  }
}


import 'package:new_app/Data/dataSource/sources_data_source.dart';
import 'package:new_app/Data/model/SourcesResponses/SourcesResponses.dart';

import '../../repo/sources_repo.dart';

class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource sourcesDataSource ;
  SourcesRepoImpl(this.sourcesDataSource);


    @override
  Future<SourcesResponses> getSources(String category) {
      return sourcesDataSource.getSources(category);

    }
  }
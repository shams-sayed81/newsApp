import 'package:injectable/injectable.dart';
import 'package:new_app/Data/dataSource/sources_data_source.dart';
import 'package:new_app/Data/model/SourcesResponses/SourcesResponses.dart';

import '../../repo/sources_repo.dart';
@Injectable(as: SourcesRepo)
class SourcesRepoImpl extends SourcesRepo{
  SourcesDataSource sourcesDataSource ;
  @factoryMethod
  SourcesRepoImpl(this.sourcesDataSource);


    @override
  Future<SourcesResponses> getSources(String category) {
      return sourcesDataSource.getSources(category);

    }
  }
import 'package:injectable/injectable.dart';
import 'package:new_app/Data/model/SourcesResponses/SourcesResponses.dart';

import '../../core/remote/api_manager.dart';
import '../dataSource/sources_data_source.dart';
@Injectable(as:SourcesDataSource )

class SourcesDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;
  @factoryMethod
  SourcesDataSourceImpl (this.apiManager);

  @override
  Future<SourcesResponses> getSources(String category) {
    return apiManager.getSources(category);
  }

}
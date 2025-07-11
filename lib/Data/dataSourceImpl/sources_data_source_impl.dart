import 'package:new_app/Data/model/SourcesResponses/SourcesResponses.dart';

import '../../core/remote/api_manager.dart';
import '../dataSource/sources_data_source.dart';

class SourcesDataSourceImpl extends SourcesDataSource {
  ApiManager apiManager;
  SourcesDataSourceImpl (this.apiManager);

  @override
  Future<SourcesResponses> getSources(String category) {
    return apiManager.getSources(category);
  }

}
import 'package:new_app/Data/model/SourcesResponses/SourcesResponses.dart';

abstract class SourcesDataSource {
  Future<SourcesResponses> getSources (String category);
}
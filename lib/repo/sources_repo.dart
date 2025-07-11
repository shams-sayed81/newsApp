import '../Data/model/SourcesResponses/SourcesResponses.dart';

abstract class SourcesRepo {
  Future<SourcesResponses> getSources (String category);

}
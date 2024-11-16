part of 'data_source.dart';

class FindMeDataSource {
  final ApiUtils _apiUtils;

  FindMeDataSource(this._apiUtils);

  final String _api = '/api';

  Future<ResultDef<List<PersonModel>>> getDataWithFilters({
    required Map<String, String> parameters,
  }) async {
    String path = '$_api/';

    ResultDef<MapJson> result = await _apiUtils.makeRequest(
      method: MethodApi.get,
      path: path,
      queryParameters: parameters,
    );

    return result.when(
      fail: Fail.new,
      success: (MapJson success) => SuccessDef<List<PersonModel>>(
        success.getModelList('results', PersonModel.fromJson),
      ),
    );
  }
}

part of '../repositories.dart';

class FindMeRepository implements IFindMeRepository {
  FindMeRepository(
    this._findMeDataSource,
  );

  final FindMeDataSource _findMeDataSource;

  @override
  Future<ResultDef<List<Person>>> getDataWithFilters({
    required Map<String, String> parameters,
  }) async {
    final ResultDef<List<PersonModel>> result =
        await _findMeDataSource.getDataWithFilters(
      parameters: parameters,
    );

    return result.when(
      fail: Fail.new,
      success: (List<PersonModel> success) => ResultDef<List<Person>>.success(
        success.map((PersonModel person) => person.toEntity()).toList(),
      ),
    );
  }
}

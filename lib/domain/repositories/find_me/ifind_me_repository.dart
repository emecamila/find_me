part of '../repositories.dart';

abstract class IFindMeRepository {
  Future<ResultDef<List<Person>>> getDataWithFilters({
    required Map<String, String> parameters,
  });
}

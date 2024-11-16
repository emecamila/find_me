part of 'use_cases.dart';

class GetDataWithFiltersUseCase {
  final IFindMeRepository _iBaseRepository;

  GetDataWithFiltersUseCase(this._iBaseRepository);

  Future<ResultDef<List<Person>>> call({
    required Map<String, String> parameters,
  }) =>
      _iBaseRepository.getDataWithFilters(
        parameters: parameters,
      );
}

part of 'dependencies.dart';

@riverpod
FindMeDataSource findMeDataSource(Ref ref) => FindMeDataSource(
      ref.read(findMeApiProvider),
    );

@riverpod
FindMeRepository findMeRepository(Ref ref) => FindMeRepository(
      ref.read(findMeDataSourceProvider),
    );

@riverpod
GetDataWithFiltersUseCase getDataWithFiltersUseCase(Ref ref) =>
    GetDataWithFiltersUseCase(
      ref.read(findMeRepositoryProvider),
    );

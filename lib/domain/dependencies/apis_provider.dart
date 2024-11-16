part of 'dependencies.dart';

const String kRootPathFindMe = 'randomuser.me';

@riverpod
Dio client(Ref ref) => Dio();

@riverpod
ApiUtils findMeApi(Ref ref) => ApiUtils(
      client: ref.watch(clientProvider),
      host: kRootPathFindMe,
    );

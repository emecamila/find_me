part of 'splash.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  SplashState build() => SplashState.initial();

  Future<void> processRoute() async {
    state = state.copyWith(
      event: UIEvent<void>.run(
        function: (BuildContext context) {
          Future<void>.delayed(
            Duration(seconds: Layout.space2.toInt()),
          ).then((_) {
            if (context.mounted) {
              Navigator.pushReplacementNamed(
                context,
                Routes.kRouteHome,
              );
            }
          });
        },
      ),
    );
  }
}

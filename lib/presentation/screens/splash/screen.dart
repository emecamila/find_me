part of 'splash.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
        builder: (_) => const SplashScreen(),
      );

  @override
  ConsumerState<SplashScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SplashScreen> {
  late final SplashViewModel viewModel;

  @override
  void initState() {
    viewModel = ref.read(splashViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.processRoute();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<UIEvent<dynamic>?>(
        splashViewModelProvider.select((SplashState state) => state.event), (
      UIEvent<dynamic>? previousEvent,
      UIEvent<dynamic>? newEvent,
    ) async {
      final dynamic value =
          await UIEventHandler.handleEvent(context, newEvent, previousEvent);
      if (newEvent != null && newEvent.returnFunction != null) {
        newEvent.returnFunction!(value);
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SizedBox.square(
          dimension: Layout.space300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Layout.space16,
                  ),
                  child: Image.asset(
                    Jpegs.fmLogo,
                  ),
                ),
              ),
              Spacing.spacingV64,
              const CircularProgressIndicator(
                color: FMColors.orange3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

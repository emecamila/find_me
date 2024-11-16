part of 'dependencies.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() => const Locale('en');

  void setLocale(Locale locale) {
    state = locale;
  }
}

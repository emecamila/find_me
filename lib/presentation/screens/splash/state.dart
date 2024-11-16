part of 'splash.dart';

class SplashState {
  SplashState({
    this.event,
  });

  final UIEvent<dynamic>? event;

  factory SplashState.initial() => SplashState();

  SplashState copyWith({
    UIEvent<dynamic>? event,
  }) =>
      SplashState(
        event: event ?? this.event,
      );
}

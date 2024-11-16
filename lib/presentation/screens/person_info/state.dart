part of 'person_info.dart';

class PersonInfoState {
  final UIEvent<dynamic>? event;

  PersonInfoState({
    this.event,
  });

  factory PersonInfoState.initial() => PersonInfoState();

  PersonInfoState copyWith({
    UIEvent<dynamic>? event,
  }) =>
      PersonInfoState(
        event: event ?? this.event,
      );
}

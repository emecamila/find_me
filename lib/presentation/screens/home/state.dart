part of 'home.dart';

class HomeState {
  final List<Person> persons;
  final List<Person> personsCopy;
  final int page;
  final String filterGender;
  final bool inProcess;
  final bool showGoTopButton;
  final UIEvent<dynamic>? event;

  HomeState({
    required this.persons,
    required this.personsCopy,
    required this.page,
    required this.filterGender,
    required this.inProcess,
    required this.showGoTopButton,
    this.event,
  });

  factory HomeState.initial() => HomeState(
        persons: <Person>[],
        personsCopy: <Person>[],
        page: 1,
        filterGender: kEmptyString,
        inProcess: false,
        showGoTopButton: false,
      );

  HomeState copyWith({
    List<Person>? persons,
    List<Person>? personsCopy,
    int? page,
    String? filterGender,
    bool? inProcess,
    bool? showGoTopButton,
    UIEvent<dynamic>? event,
  }) =>
      HomeState(
        persons: persons ?? this.persons,
        personsCopy: personsCopy ?? this.personsCopy,
        page: page ?? this.page,
        filterGender: filterGender ?? this.filterGender,
        inProcess: inProcess ?? this.inProcess,
        showGoTopButton: showGoTopButton ?? this.showGoTopButton,
        event: event ?? this.event,
      );
}

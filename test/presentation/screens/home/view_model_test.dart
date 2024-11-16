import 'package:find_me/data/extensions/extensions.dart';
import 'package:find_me/domain/dependencies/dependencies.dart';
import 'package:find_me/domain/entities/entities.dart';
import 'package:find_me/domain/use_cases/use_cases.dart';
import 'package:find_me/presentation/screens/home/home.dart';
import 'package:find_me/presentation/screens/person_info/person_info.dart';
import 'package:find_me/presentation/utils/utils.dart';
import 'package:find_me/presentation/widgets/ions/ions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_model_test.mocks.dart';

@GenerateMocks(
  <Type>[
    GetDataWithFiltersUseCase,
    ScrollPosition,
    ScrollController,
  ],
)
void main() {
  late MockGetDataWithFiltersUseCase mockUseCase;
  late ProviderContainer ref;
  late MockScrollPosition scrollPosition;
  late MockScrollController scrollController;

  setUp(() {
    mockUseCase = MockGetDataWithFiltersUseCase();
    scrollPosition = MockScrollPosition();
    scrollController = MockScrollController();
    ref = ProviderContainer(
      overrides: <Override>[
        getDataWithFiltersUseCaseProvider.overrideWithValue(mockUseCase),
      ],
    );
    when(scrollController.position).thenReturn(scrollPosition);
    when(scrollController.offset).thenReturn(100);
    when(scrollPosition.pixels).thenReturn(500);
    when(scrollPosition.maxScrollExtent).thenReturn(1000);
  });

  tearDown(() {
    ref.dispose();
    scrollController.dispose();
    scrollPosition.dispose();
  });

  group(
    'HomeViewModel Test',
    () {
      group('initData()', () {
        test('initData success case', () async {
          final List<Person> mockPersons = <Person>[Person.initial()];
          when(mockUseCase.call(parameters: anyNamed('parameters'))).thenAnswer(
            (_) async => ResultDef<List<Person>>.success(
              mockPersons,
            ),
          );

          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          await viewModel.initData();

          final HomeState state = ref.read(homeViewModelProvider);
          expect(state.persons, mockPersons);
          expect(state.personsCopy, mockPersons);
        });

        test('initData failure case', () async {
          when(mockUseCase.call(parameters: anyNamed('parameters'))).thenAnswer(
            (_) async => ResultDef<List<Person>>.fail(
              const BackError(statusCode: 500),
            ),
          );

          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          await viewModel.initData();

          final HomeState state = ref.read(homeViewModelProvider);
          expect(state.persons, isEmpty);
          expect(state.personsCopy, isEmpty);
        });
      });
      group('fetchMoreData()', () {
        test('fetchMoreData success case', () async {
          final List<Person> mockPersons = <Person>[
            Person.initial(),
          ];

          when(mockUseCase.call(parameters: anyNamed('parameters'))).thenAnswer(
            (_) async => ResultDef<List<Person>>.success(mockPersons),
          );

          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          HomeState state = ref.read(homeViewModelProvider);

          expect(state.page, 1);
          expect(state.persons, <Person>[]);
          expect(state.personsCopy, <Person>[]);

          await viewModel.fetchMoreData(kEmptyString);

          state = ref.read(homeViewModelProvider);
          expect(state.inProcess, false);
          expect(state.page, 2);
          expect(state.persons, mockPersons);
          expect(state.personsCopy, mockPersons);
        });

        test('fetchMoreData failure case', () async {
          when(mockUseCase.call(parameters: anyNamed('parameters'))).thenAnswer(
            (_) async => ResultDef<List<Person>>.fail(
              const BackError(statusCode: 500),
            ),
          );

          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          await viewModel.fetchMoreData('John');

          final HomeState state = ref.read(homeViewModelProvider);
          expect(state.inProcess, false);
          expect(state.page, 1);
          expect(state.persons, isEmpty);
          expect(state.personsCopy, isEmpty);
        });
      });
      group('Test scrollListener()', () {
        test('scrollListener updates showGoTopButton when scrolling down', () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          scrollController.jumpTo(Layout.space300);

          viewModel.scrollListener(scrollController, kEmptyString);

          final HomeState state = ref.read(homeViewModelProvider);
          expect(state.showGoTopButton, true);
        });
        test('scrollListener hides showGoTopButton when scrolling up', () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);
          HomeState state = ref.read(homeViewModelProvider);

          scrollController.jumpTo(Layout.space24);
          expect(state.showGoTopButton, false);

          viewModel.scrollListener(scrollController, kEmptyString);
          state = ref.read(homeViewModelProvider);
          expect(state.showGoTopButton, true);
        });

        test(
          '''scrollListener calls fetchMoreData when near the bottom of the list''',
          () async {
            HomeState state = ref.read(homeViewModelProvider);
            HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

            final List<Person> mockPersons = <Person>[Person.initial()];

            when(mockUseCase.call(parameters: anyNamed('parameters')))
                .thenAnswer(
              (_) async => ResultDef<List<Person>>.success(mockPersons),
            );

            expect(state.persons.isEmpty, true);

            state = state.copyWith(
              persons: mockPersons,
              personsCopy: mockPersons,
            );

            expect(state.persons, mockPersons);

            scrollController.jumpTo(scrollPosition.maxScrollExtent - 300);

            viewModel.scrollListener(scrollController, kEmptyString);

            expect(
              scrollPosition.pixels >=
                      scrollPosition.maxScrollExtent - Layout.space500 &&
                  state.persons.isNotEmpty,
              true,
            );
          },
        );

        test(
            '''scrollListener does not call fetchMoreData if persons list is empty''',
            () async {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          scrollController
              .jumpTo(scrollController.position.maxScrollExtent - 500);

          viewModel.scrollListener(scrollController, 'John');

          verifyNever(mockUseCase.call(parameters: anyNamed('parameters')));
        });
      });

      group('Test scrollToTop()', () {
        test('scrollToTop calls animateTo with correct parameters', () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          viewModel.scrollToTop(scrollController);

          verify(
            scrollController.animateTo(
              0,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: Layout.space500.toInt()),
            ),
          ).called(1);
        });
      });
      group('Test navigateToPerson()', () {
        test('navigateToPerson updates state with correct route', () {
          final Person person = Person.initial();

          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          viewModel.navigateToPerson(person);

          final UIEventType expectedEvent = UIEvent<void>.navigate(
            route: PersonInfoScreen.goTo(person: person),
          ).type;
          expect(viewModel.state.event?.type, equals(expectedEvent));
        });
      });
      group('Test onSearch', () {
        test('onSearch sets persons to personsCopy when searchText is empty',
            () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          final List<Person> personsCopy = <Person>[
            Person.initial(),
          ];

          viewModel.state = viewModel.state.copyWith(personsCopy: personsCopy);
          viewModel.onSearch(kEmptyString);

          expect(viewModel.state.persons, equals(personsCopy));
        });

        test('onSearch filters persons by searchText', () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          final List<Person> personsCopy = <Person>[
            Person(
              gender: kEmptyString,
              name: const PersonName(
                title: kEmptyString,
                firstName: 'John',
                lastName: 'Doe',
              ),
              email: kEmptyString,
              username: kEmptyString,
              nationality: kEmptyString,
              phone: kEmptyString,
              pictures: PersonPictures.initial(),
              location: Location.initial(),
              dob: DOB.initial(),
            ),
            Person(
              gender: kEmptyString,
              name: const PersonName(
                title: kEmptyString,
                firstName: 'Johnny',
                lastName: 'Smith',
              ),
              email: kEmptyString,
              username: kEmptyString,
              nationality: kEmptyString,
              phone: kEmptyString,
              pictures: PersonPictures.initial(),
              location: Location.initial(),
              dob: DOB.initial(),
            ),
            Person(
              gender: kEmptyString,
              name: const PersonName(
                title: kEmptyString,
                firstName: 'Alice',
                lastName: 'Brown',
              ),
              email: kEmptyString,
              username: kEmptyString,
              nationality: kEmptyString,
              phone: kEmptyString,
              pictures: PersonPictures.initial(),
              location: Location.initial(),
              dob: DOB.initial(),
            ),
          ];

          viewModel.state = viewModel.state.copyWith(personsCopy: personsCopy);

          viewModel.onSearch('John');

          final List<Person> expectedFilteredList = <Person>[
            Person(
              gender: kEmptyString,
              name: const PersonName(
                title: kEmptyString,
                firstName: 'John',
                lastName: 'Doe',
              ),
              email: kEmptyString,
              username: kEmptyString,
              nationality: kEmptyString,
              phone: kEmptyString,
              pictures: PersonPictures.initial(),
              location: Location.initial(),
              dob: DOB.initial(),
            ),
            Person(
              gender: kEmptyString,
              name: const PersonName(
                title: kEmptyString,
                firstName: 'Johnny',
                lastName: 'Smith',
              ),
              email: kEmptyString,
              username: kEmptyString,
              nationality: kEmptyString,
              phone: kEmptyString,
              pictures: PersonPictures.initial(),
              location: Location.initial(),
              dob: DOB.initial(),
            ),
          ];

          expect(
            viewModel.state.personsCopy,
            equals(personsCopy),
          );

          expect(
            viewModel.state.persons.length,
            equals(expectedFilteredList.length),
          );
        });

        test('onSearch sets persons to empty list if no matches found', () {
          final HomeViewModel viewModel =
              ref.read(homeViewModelProvider.notifier);

          final List<Person> personsCopy = <Person>[
            Person.initial(),
            Person.initial(),
          ];

          viewModel.state = viewModel.state.copyWith(personsCopy: personsCopy);

          viewModel.onSearch('xyz');
          expect(viewModel.state.persons, equals(<Person>[]));
        });
      });
    },
  );
}

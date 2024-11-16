part of 'home.dart';

@Riverpod(keepAlive: true)
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() => HomeState.initial();

  Future<void> initData() async {
    state = state.copyWith(event: UIEvent<void>.loading());
    ResultDef<List<Person>> value =
        await ref.read(getDataWithFiltersUseCaseProvider).call(
      parameters: <String, String>{'results': '10'},
    );

    value.when(
      fail: (BackError fail) {
        state = state.copyWith(event: UIEvent<void>.hideLoading());
      },
      success: (List<Person> success) {
        state = state.copyWith(
          persons: success,
          personsCopy: success,
        );
        state = state.copyWith(event: UIEvent<void>.hideLoading());
      },
    );
  }

  Future<void> fetchMoreData(String search) async {
    if (!state.inProcess) {
      state = state.copyWith(inProcess: true);
      ResultDef<List<Person>> value =
          await ref.read(getDataWithFiltersUseCaseProvider).call(
        parameters: <String, String>{
          'page': state.page.toString(),
          'results': '10',
          'gender': state.filterGender,
        },
      );

      value.when(
        fail: (BackError fail) {
          state = state.copyWith(inProcess: false);
        },
        success: (List<Person> success) {
          List<Person> value = <Person>[
            ...state.persons,
            ...success,
          ];
          state = state.copyWith(
            page: state.page + 1,
            persons: value,
            personsCopy: value,
          );
          onSearch(search);
          state = state.copyWith(inProcess: false);
        },
      );
    }
  }

  void scrollListener(
    ScrollController controller,
    String search,
  ) {
    if (controller.offset > Layout.space96) {
      if (!state.showGoTopButton) {
        state = state.copyWith(showGoTopButton: true);
      }
    } else {
      state = state.copyWith(showGoTopButton: false);
    }

    if (controller.position.pixels >=
            controller.position.maxScrollExtent - Layout.space500 &&
        state.persons.isNotEmpty) {
      fetchMoreData(search);
    }
  }

  void scrollToTop(ScrollController controller) {
    controller.animateTo(
      0,
      curve: Curves.easeInOut,
      duration: Duration(
        milliseconds: Layout.space500.toInt(),
      ),
    );
  }

  void navigateToPerson(Person person) {
    state = state.copyWith(
      event: UIEvent<void>.navigate(
        route: PersonInfoScreen.goTo(
          person: person,
        ),
      ),
    );
  }

  void onSearch(String searchText) {
    if (searchText.isEmpty) {
      state = state.copyWith(persons: state.personsCopy);
      return;
    }

    searchText = searchText.toLowerCase();

    List<Person> filteredList = state.personsCopy
        .where(
          (Person person) =>
              person.name.fullName.toLowerCase().contains(searchText),
        )
        .toList();

    filteredList.sort(
      (Person a, Person b) => a.name.fullName
          .indexOf(searchText)
          .compareTo(b.name.fullName.indexOf(searchText)),
    );

    state = state.copyWith(
      persons: filteredList.isNotEmpty ? filteredList : <Person>[],
    );
  }

  Future<void> onTapFilter() async {
    String valueGender = state.filterGender;
    state = state.copyWith(
      event: UIEvent<void>.run(
        function: (BuildContext context) async {
          valueGender = await showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                  child: FilterBottomSheetModal(
                    gender: valueGender,
                  ),
                ),
              ) ??
              state.filterGender;

          if (valueGender != state.filterGender) {
            ResultDef<List<Person>> value =
                await ref.read(getDataWithFiltersUseCaseProvider).call(
              parameters: <String, String>{
                'results': '10',
                'gender': valueGender,
              },
            );

            value.when(
              fail: (BackError fail) {
                state = state.copyWith(event: UIEvent<void>.hideLoading());
              },
              success: (List<Person> success) {
                state = state.copyWith(
                  persons: success,
                  personsCopy: success,
                  filterGender: valueGender,
                );
                state = state.copyWith(event: UIEvent<void>.hideLoading());
              },
            );
          }
        },
      ),
    );
  }
}

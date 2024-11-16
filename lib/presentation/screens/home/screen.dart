part of 'home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
        builder: (_) => const HomeScreen(),
      );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late ScrollController _scrollController;
  late TextEditingController _searchController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(
        () {
          String search = _searchController.text;
          ref.read(homeViewModelProvider.notifier).scrollListener(
                _scrollController,
                search,
              );
        },
      );
      ref.read(homeViewModelProvider.notifier).initData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeState state = ref.watch(homeViewModelProvider);
    HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);

    ref.listen<UIEvent<dynamic>?>(
        homeViewModelProvider.select((HomeState state) => state.event), (
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
      appBar: AppBar(
        title: Text(
          L10n.of(context).sHomeFindMe,
          style: TypoTitle.size24,
        ),
        surfaceTintColor: FMColors.orange1,
        backgroundColor: FMColors.orange1,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: Layout.space32,
            ),
            child: LanguageButton(),
          ),
        ],
      ),
      body: HomeTemplate(
        persons: state.persons,
        scrollController: _scrollController,
        searchController: _searchController,
        onRefreshData: () async {
          _searchController.clear();
          viewModel.initData();
        },
        onTapFilter: viewModel.onTapFilter,
        onSearchPerson: viewModel.onSearch,
        onTapPerson: viewModel.navigateToPerson,
      ),
      floatingActionButton: state.showGoTopButton
          ? FMIconButton(
              icon: Icons.arrow_upward,
              onTap: () => viewModel.scrollToTop(
                _scrollController,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

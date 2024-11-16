part of 'templates.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({
    required this.persons,
    required this.scrollController,
    required this.searchController,
    required this.onRefreshData,
    required this.onTapFilter,
    required this.onTapPerson,
    required this.onSearchPerson,
    super.key,
  });

  final List<Person> persons;
  final ScrollController scrollController;
  final TextEditingController searchController;
  final RefreshCallback onRefreshData;
  final VoidCallback onTapFilter;
  final void Function(Person) onTapPerson;
  final void Function(String)? onSearchPerson;

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: widget.onRefreshData,
        color: FMColors.black100,
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: <Widget>[
            SliverPadding(
              padding: FMPadding.padding_24,
              sliver: SliverToBoxAdapter(
                child: FMTextField(
                  controller: widget.searchController,
                  label: L10n.of(context).sHomeSearchForPeople,
                  prefixIcon: Icons.search,
                  background: FMColors.grey100,
                  focusedBorderColor: FMColors.grey400,
                  suffixIcon: Icons.filter_list,
                  onTapSuffixIcon: widget.onTapFilter,
                  onChanged: widget.onSearchPerson,
                ),
              ),
            ),
            if (widget.persons.isNotEmpty) ...<Widget>[
              SliverList.builder(
                itemCount: widget.persons.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Layout.space24,
                    vertical: Layout.space12,
                  ),
                  child: PersonCard(
                    person: widget.persons[index],
                    onTap: () => widget.onTapPerson(
                      widget.persons[index],
                    ),
                  ),
                ),
              ),
              if (widget.persons.length < 5)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
            ] else
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Text(
                      L10n.of(context).sHomeNoPeopleFound,
                      style: TypoBody.size16.copyWith(
                        color: FMColors.grey600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
}

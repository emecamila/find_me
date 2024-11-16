part of 'organisms.dart';

class FilterBottomSheetModal extends StatefulWidget {
  const FilterBottomSheetModal({
    required this.gender,
    super.key,
  });

  final String gender;

  @override
  State<FilterBottomSheetModal> createState() => _FilterBottomSheetModalState();
}

class _FilterBottomSheetModalState extends State<FilterBottomSheetModal> {
  String key = kEmptyString;

  @override
  void initState() {
    key = kEmptyString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: Layout.space500,
          maxWidth: Layout.space500,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: FMColors.white100,
            borderRadius: BorderRadius.circular(
              Layout.space16,
            ),
          ),
          child: Padding(
            padding: FMPadding.padding_24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  L10n.of(context).sHomeFilters,
                  style: TypoTitle.size24,
                ),
                Spacing.spacingV24,
                Text(
                  L10n.of(context).sHomeGenderDescriptive,
                  style: TypoTitle.size16,
                ),
                FilterSelection(
                  items: genders(context),
                  gender: widget.gender,
                  onSelect: (String value) {
                    key = value;
                  },
                ),
                Spacing.spacingV24,
                FMButton.primary(
                  text: L10n.of(context).sHomeSearch,
                  onPressed: () {
                    Navigator.pop(context, key);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

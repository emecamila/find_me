part of 'molecules.dart';

class FilterSelection extends StatefulWidget {
  const FilterSelection({
    required this.items,
    required this.gender,
    required this.onSelect,
    super.key,
  });

  final List<Selection> items;
  final String gender;
  final void Function(String) onSelect;

  @override
  State<FilterSelection> createState() => _FilterSelectionState();
}

class _FilterSelectionState extends State<FilterSelection> {
  List<Selection> selections = <Selection>[];

  @override
  void initState() {
    selections = widget.items;
    for (int i = 0; i < selections.length; i++) {
      if (selections[i].key == widget.gender) {
        selections[i] = selections[i].copyWith(
          selected: true,
        );
      } else {
        selections[i] = selections[i].copyWith(
          selected: false,
        );
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    selections = <Selection>[];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Wrap(
        children: List<Widget>.generate(
          selections.length,
          (int index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Checkbox(
                value: selections[index].selected,
                onChanged: (bool? a) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      if (index == i) {
                        selections[i] = selections[i].copyWith(
                          selected: true,
                        );
                      } else {
                        selections[i] = selections[i].copyWith(
                          selected: false,
                        );
                      }
                    }
                  });
                  widget.onSelect(selections[index].key);
                },
              ),
              Text(
                selections[index].text,
              ),
            ],
          ),
        ),
      );
}

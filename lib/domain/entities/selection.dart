part of 'entities.dart';

class Selection {
  final String key;
  final String text;
  final bool selected;

  const Selection({
    required this.key,
    required this.text,
    this.selected = false,
  });

  Selection copyWith({
    String? key,
    String? text,
    bool? selected,
  }) =>
      Selection(
        key: key ?? this.key,
        text: text ?? this.text,
        selected: selected ?? this.selected,
      );

  factory Selection.initial() => const Selection(
        key: kEmptyString,
        text: kEmptyString,
      );
}

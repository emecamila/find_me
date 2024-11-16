part of 'molecules.dart';

class GenderBox extends StatelessWidget {
  const GenderBox({
    required this.gender,
    super.key,
  });

  final String gender;

  Color get colorByGender {
    Color value = FMColors.grey600;
    if (gender == kKeyMale) {
      value = FMColors.blue;
    } else if (gender == kKeyFemale) {
      value = FMColors.pink;
    } else {
      value = FMColors.grey600;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: FMColors.white90,
          border: Border.all(
            color: colorByGender,
            width: Layout.space2,
          ),
          borderRadius: BorderRadius.circular(
            Layout.space12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Layout.space12,
            vertical: Layout.space8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                titleByGender(context, gender),
                style: TypoBody.size14.copyWith(
                  color: colorByGender,
                ),
              ),
              Spacing.spacingH4,
              Icon(
                iconByGender(gender),
                color: colorByGender,
                size: Layout.space16,
              ),
            ],
          ),
        ),
      );
}

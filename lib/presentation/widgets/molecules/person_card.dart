part of 'molecules.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    required this.person,
    required this.onTap,
    super.key,
  });

  final Person person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: FMColors.grey100,
            borderRadius: BorderRadius.circular(Layout.space16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Layout.space12,
              horizontal: Layout.space16,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: Layout.space2.toInt(),
                  child: FMImage(
                    url: person.pictures.thumbnail,
                    borderRadius: BorderRadius.circular(
                      Layout.space16,
                    ),
                  ),
                ),
                Spacing.spacingH24,
                Expanded(
                  flex: Layout.space6.toInt(),
                  child: Text(
                    person.name.fullName,
                    style: TypoBody.size16,
                  ),
                ),
                Icon(
                  iconByGender(
                    person.gender,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

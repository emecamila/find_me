part of 'molecules.dart';

class ProfileNameNationality extends StatelessWidget {
  const ProfileNameNationality({
    required this.person,
    super.key,
  });

  final Person person;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${person.name.fullName} $kBar ${person.nationality}',
            style: TypoTitle.size24,
          ),
          Text(
            person.username,
          ),
        ],
      );
}

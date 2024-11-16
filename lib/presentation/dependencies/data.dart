part of 'dependencies.dart';

List<Selection> genders(BuildContext context) => <Selection>[
      Selection(key: kEmptyString, text: L10n.of(context).gAll, selected: true),
      Selection(key: kKeyMale, text: L10n.of(context).gMale),
      Selection(key: kKeyFemale, text: L10n.of(context).gFemale),
    ];

String titleByGender(BuildContext context, String gender) {
  String value = L10n.of(context).gUnknown;
  if (gender == kKeyMale) {
    value = L10n.of(context).gMale;
  } else if (gender == kKeyFemale) {
    value = L10n.of(context).gFemale;
  } else {
    value = L10n.of(context).gUnknown;
  }
  return value;
}

IconData iconByGender(String gender) {
  IconData value = Icons.dangerous;
  if (gender == kKeyMale) {
    value = Icons.male;
  } else if (gender == kKeyFemale) {
    value = Icons.female;
  } else {
    value = Icons.dangerous;
  }
  return value;
}

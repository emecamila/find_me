part of 'entities.dart';

class PersonName {
  final String title;
  final String firstName;
  final String lastName;

  const PersonName({
    required this.title,
    required this.firstName,
    required this.lastName,
  });

  PersonName copyWith({
    String? title,
    String? firstName,
    String? lastName,
  }) =>
      PersonName(
        title: title ?? this.title,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory PersonName.initial() => const PersonName(
        title: kEmptyString,
        firstName: kEmptyString,
        lastName: kEmptyString,
      );

  String get fullName => '$firstName $lastName';
}

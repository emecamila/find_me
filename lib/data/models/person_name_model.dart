part of '../../data/models/models.dart';

class PersonNameModel {
  final String title;
  final String firstName;
  final String lastName;

  const PersonNameModel({
    required this.title,
    required this.firstName,
    required this.lastName,
  });

  PersonName toEntity() => PersonName(
        title: title,
        firstName: firstName,
        lastName: lastName,
      );

  factory PersonNameModel.fromJson(Map<String, dynamic> json) =>
      PersonNameModel(
        title: json.getString('title'),
        firstName: json.getString('first'),
        lastName: json.getString('last'),
      );
}

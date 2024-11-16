part of 'entities.dart';

class Person {
  final String gender;
  final PersonName name;
  final String email;
  final String username;
  final String nationality;
  final String phone;
  final PersonPictures pictures;
  final Location location;
  final DOB dob;

  const Person({
    required this.gender,
    required this.name,
    required this.email,
    required this.username,
    required this.nationality,
    required this.phone,
    required this.pictures,
    required this.location,
    required this.dob,
  });

  Person copyWith({
    String? gender,
    PersonName? name,
    String? email,
    String? username,
    String? nationality,
    String? phone,
    PersonPictures? pictures,
    Location? location,
    DOB? dob,
  }) =>
      Person(
        gender: gender ?? this.gender,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        nationality: nationality ?? this.nationality,
        phone: phone ?? this.phone,
        pictures: pictures ?? this.pictures,
        location: location ?? this.location,
        dob: dob ?? this.dob,
      );

  factory Person.initial() => Person(
        gender: kEmptyString,
        name: PersonName.initial(),
        email: kEmptyString,
        username: kEmptyString,
        nationality: kEmptyString,
        phone: kEmptyString,
        pictures: PersonPictures.initial(),
        location: Location.initial(),
        dob: DOB.initial(),
      );
}

part of '../../data/models/models.dart';

class PersonModel {
  PersonModel({
    required this.gender,
    required this.personName,
    required this.email,
    required this.username,
    required this.nationality,
    required this.phone,
    required this.pictures,
    required this.location,
    required this.dob,
  });

  final String gender;
  final PersonNameModel personName;
  final String email;
  final String username;
  final String nationality;
  final String phone;
  final PersonPicturesModel pictures;
  final LocationModel location;
  final DOBModel dob;

  Person toEntity() => Person(
        gender: gender,
        name: personName.toEntity(),
        email: email,
        username: username,
        nationality: nationality,
        phone: phone,
        pictures: pictures.toEntity(),
        location: location.toEntity(),
        dob: dob.toEntity(),
      );

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        gender: json.getString('gender'),
        personName: json.getModel('name', PersonNameModel.fromJson),
        email: json.getString('email'),
        username: json.getMap('login').getString('username'),
        nationality: json.getString('nat'),
        phone: json.getString('phone'),
        pictures: json.getModel('picture', PersonPicturesModel.fromJson),
        location: json.getModel('location', LocationModel.fromJson),
        dob: json.getModel('dob', DOBModel.fromJson),
      );
}

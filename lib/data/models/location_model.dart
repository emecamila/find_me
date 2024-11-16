part of 'models.dart';

class LocationModel {
  final String city;
  final String country;
  final CoordinatesModel coordinates;
  final String zipcode;

  const LocationModel({
    required this.city,
    required this.country,
    required this.coordinates,
    required this.zipcode,
  });

  Location toEntity() => Location(
        city: city,
        country: country,
        coordinates: coordinates.toEntity(),
        zipcode: zipcode,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        city: json.getString('city'),
        country: json.getString('country'),
        coordinates: json.getModel('coordinates', CoordinatesModel.fromJson),
        zipcode: json.getString('postcode'),
      );
}

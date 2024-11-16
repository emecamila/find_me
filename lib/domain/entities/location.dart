part of 'entities.dart';

class Location {
  final String city;
  final String country;
  final Coordinates coordinates;
  final String zipcode;

  const Location({
    required this.city,
    required this.country,
    required this.coordinates,
    required this.zipcode,
  });

  Location copyWith({
    String? city,
    String? country,
    Coordinates? coordinates,
    String? zipcode,
  }) =>
      Location(
        city: city ?? this.city,
        country: country ?? this.country,
        coordinates: coordinates ?? this.coordinates,
        zipcode: zipcode ?? this.zipcode,
      );

  factory Location.initial() => Location(
        city: kEmptyString,
        country: kEmptyString,
        coordinates: Coordinates.initial(),
        zipcode: kEmptyString,
      );
}

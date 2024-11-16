part of 'entities.dart';

class Coordinates {
  final double longitude;
  final double latitude;

  const Coordinates({
    required this.longitude,
    required this.latitude,
  });

  Coordinates copyWith({
    double? longitude,
    double? latitude,
  }) =>
      Coordinates(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );

  factory Coordinates.initial() => const Coordinates(
        longitude: 0,
        latitude: 0,
      );

  LatLng get position => LatLng(
        latitude,
        longitude,
      );

  Marker get marker {
    LatLng positionValue = LatLng(
      latitude,
      longitude,
    );
    return Marker(
      markerId: MarkerId(
        '$longitude$latitude',
      ),
      position: positionValue,
    );
  }
}

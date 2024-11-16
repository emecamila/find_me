part of 'models.dart';

class CoordinatesModel {
  final String longitude;
  final String latitude;

  const CoordinatesModel({
    required this.longitude,
    required this.latitude,
  });

  Coordinates toEntity() => Coordinates(
        longitude: double.parse(longitude),
        latitude: double.parse(latitude),
      );

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesModel(
        longitude: json.getString('longitude'),
        latitude: json.getString('latitude'),
      );
}

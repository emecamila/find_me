part of 'models.dart';

class PersonPicturesModel {
  final String large;
  final String thumbnail;

  const PersonPicturesModel({
    required this.large,
    required this.thumbnail,
  });

  PersonPictures toEntity() => PersonPictures(
        large: large,
        thumbnail: thumbnail,
      );

  factory PersonPicturesModel.fromJson(Map<String, dynamic> json) =>
      PersonPicturesModel(
        large: json.getString('large'),
        thumbnail: json.getString('thumbnail'),
      );
}

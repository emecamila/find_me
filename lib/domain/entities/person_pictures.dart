part of 'entities.dart';

class PersonPictures {
  final String large;
  final String thumbnail;

  const PersonPictures({
    required this.large,
    required this.thumbnail,
  });

  PersonPictures copyWith({
    String? large,
    String? thumbnail,
  }) =>
      PersonPictures(
        large: large ?? this.large,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory PersonPictures.initial() => const PersonPictures(
        large: kEmptyString,
        thumbnail: kEmptyString,
      );
}

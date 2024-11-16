part of 'molecules.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.image,
    required this.gender,
    super.key,
  });

  final String image;
  final String gender;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          FMImage(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            url: image,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(Layout.space16),
              bottomRight: Radius.circular(Layout.space16),
            ),
          ),
          Positioned(
            bottom: Layout.space24,
            right: Layout.space24,
            child: GenderBox(
              gender: gender,
            ),
          ),
        ],
      );
}

part of 'atoms.dart';

class FMImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BlendMode? blendMode;
  final Gradient? gradient;

  const FMImage({
    required this.url,
    this.borderRadius,
    this.height,
    this.width,
    this.radius = Layout.space20,
    this.fit,
    this.color,
    this.blendMode,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: url,
            fit: fit ?? BoxFit.cover,
            color: color,
            colorBlendMode: blendMode,
            placeholder: (_, __) => FittedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: FMColors.grey200,
                ),
                child: Padding(
                  padding: FMPadding.padding_24,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: FMColors.grey700,
                    ),
                  ),
                ),
              ),
            ),
            errorWidget: (_, __, ___) => FittedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: FMColors.grey200,
                ),
                child: Padding(
                  padding: FMPadding.padding_12,
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: FMColors.grey700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

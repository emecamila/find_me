part of 'atoms.dart';

class FMButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final Color borderColor;
  final bool isFullWidth;
  final bool isCollapsed;
  final VoidCallback? onPressed;
  final IconData? trailing;

  final TextDecoration? decoration;
  final double borderRadius;
  final double elevation;
  final TextStyle? textStyle;
  final Widget? widget;

  const FMButton({
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.onPressed,
    this.isFullWidth = true,
    this.isCollapsed = true,
    this.borderColor = Colors.transparent,
    this.trailing,
    this.decoration,
    this.borderRadius = Layout.space96,
    this.elevation = 10,
    this.textStyle,
    this.widget,
    super.key,
  });

  const FMButton.primary({
    required this.text,
    required this.onPressed,
    this.isFullWidth = true,
    this.isCollapsed = true,
    this.trailing,
    this.decoration,
    this.borderRadius = Layout.space96,
    this.elevation = 10,
    this.textStyle,
    this.widget,
    super.key,
  })  : textColor = FMColors.black80,
        buttonColor = FMColors.orange2,
        borderColor = FMColors.orange2;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: onPressed != null ? borderColor : Colors.grey.shade400,
          ),
          backgroundColor: buttonColor,
          foregroundColor: buttonColor,
          surfaceTintColor: buttonColor,
          disabledBackgroundColor: Colors.grey.shade400,
          disabledForegroundColor: Colors.grey.shade400,
          elevation: elevation,
          padding: isCollapsed ? FMPadding.paddingV12 : FMPadding.paddingV20,
          minimumSize: isFullWidth
              ? const Size(
                  double.infinity,
                  0,
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: FMPadding.paddingH16,
          child: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: widget != null,
                  replacement: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TypoBody.size16.copyWith(
                          color: onPressed != null
                              ? textColor
                              : Colors.grey.shade600,
                          decoration: decoration,
                        ),
                  ),
                  child: widget ?? const SizedBox.shrink(),
                ),
                if (trailing != null) ...<Widget>[
                  Spacing.spacingH12,
                  Icon(
                    trailing,
                    color: textColor,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}

part of 'atoms.dart';

class FMIconButton extends StatelessWidget {
  const FMIconButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) => IconButton.filled(
        onPressed: onTap,
        icon: Icon(
          icon,
        ),
        color: iconColor,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            backgroundColor ?? FMColors.orange2,
          ),
        ),
      );
}

part of 'atoms.dart';

class FMListTile extends StatelessWidget {
  const FMListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: Layout.space12,
          ),
          child: Icon(
            icon,
            color: FMColors.grey600,
          ),
        ),
        title: Text(
          title,
          style: TypoBody.size14.copyWith(
            color: FMColors.grey600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TypoBody.size16,
        ),
      );
}

part of 'atoms.dart';

class LanguageButton extends ConsumerStatefulWidget {
  const LanguageButton({super.key});

  @override
  ConsumerState<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends ConsumerState<LanguageButton> {
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(
          Layout.space12,
        ),
        onTap: () {
          late String key;

          if (ref.read(localeNotifierProvider).languageCode == 'en') {
            key = 'es';
          } else {
            key = 'en';
          }

          ref.read(localeNotifierProvider.notifier).setLocale(Locale(key));
        },
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: FMPadding.padding_12,
            child: Text(
              ref.watch(localeNotifierProvider).languageCode,
            ),
          ),
        ),
      );
}

part of 'person_info.dart';

@riverpod
class PersonInfoViewModel extends _$PersonInfoViewModel {
  @override
  PersonInfoState build() => PersonInfoState.initial();

  Future<void> makePhoneCall(String number) async {
    String normalizedNumber = number.replaceAll(RegExp(r'[^0-9+]'), '');
    final Uri callUri = Uri(scheme: 'tel', path: normalizedNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      state = state.copyWith(
        event: UIEvent<void>.run(
          function: (BuildContext context) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: FMColors.orange2,
                content: Text(
                  L10n.of(context).gError,
                  style: TypoBody.size16,
                ),
              ),
            );
          },
        ),
      );
      throw 'Could not launch $normalizedNumber';
    }
  }

  Future<void> sendEmail(String email, String subject) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: <String, String>{
        'subject': subject,
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      state = state.copyWith(
        event: UIEvent<void>.run(
          function: (BuildContext context) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: FMColors.orange2,
                content: Text(
                  L10n.of(context).gError,
                  style: TypoBody.size16,
                ),
              ),
            );
          },
        ),
      );
      throw 'Could not launch email client for $email';
    }
  }

  Future<void> copyToClipboard(String textToCopy) async {
    await Clipboard.setData(ClipboardData(text: textToCopy));
    state = state.copyWith(
      event: UIEvent<void>.run(
        function: (BuildContext context) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: FMColors.orange2,
              content: Text(
                L10n.of(context).sPersonInfoCopyToClipboard,
                style: TypoBody.size16,
              ),
            ),
          );
        },
      ),
    );
  }
}

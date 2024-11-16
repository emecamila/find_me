part of 'person_info.dart';

class PersonInfoScreen extends ConsumerStatefulWidget {
  const PersonInfoScreen({
    required this.person,
    super.key,
  });

  final Person person;

  static Route<void> goTo({
    required Person person,
  }) =>
      MaterialPageRoute<void>(
        builder: (_) => PersonInfoScreen(
          person: person,
        ),
      );

  @override
  ConsumerState<PersonInfoScreen> createState() => _PersonInfoScreenState();
}

class _PersonInfoScreenState extends ConsumerState<PersonInfoScreen> {
  @override
  Widget build(BuildContext context) {
    PersonInfoViewModel viewModel =
        ref.read(personInfoViewModelProvider.notifier);

    ref.listen<UIEvent<dynamic>?>(
        personInfoViewModelProvider.select(
          (PersonInfoState state) => state.event,
        ), (
      UIEvent<dynamic>? previousEvent,
      UIEvent<dynamic>? newEvent,
    ) async {
      final dynamic value =
          await UIEventHandler.handleEvent(context, newEvent, previousEvent);
      if (newEvent != null && newEvent.returnFunction != null) {
        newEvent.returnFunction!(value);
      }
    });

    return Scaffold(
      body: PersonInfoTemplate(
        person: widget.person,
        onTapCopy: viewModel.copyToClipboard,
        onTapEmail: viewModel.sendEmail,
        onTapPhone: viewModel.makePhoneCall,
      ),
    );
  }
}

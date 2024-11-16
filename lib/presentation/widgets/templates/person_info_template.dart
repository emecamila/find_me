part of 'templates.dart';

class PersonInfoTemplate extends StatefulWidget {
  const PersonInfoTemplate({
    required this.person,
    required this.onTapCopy,
    required this.onTapPhone,
    required this.onTapEmail,
    super.key,
  });

  final Person person;
  final void Function(String) onTapCopy;
  final void Function(String) onTapPhone;
  final void Function(String, String) onTapEmail;

  @override
  State<PersonInfoTemplate> createState() => _PersonInfoTemplateState();
}

class _PersonInfoTemplateState extends State<PersonInfoTemplate> {
  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ProfileImage(
              image: widget.person.pictures.large,
              gender: widget.person.gender,
            ),
          ),
          SliverToBoxAdapter(
            child: Spacing.spacingV24,
          ),
          SliverPadding(
            padding: FMPadding.paddingH24,
            sliver: SliverToBoxAdapter(
              child: ProfileNameNationality(
                person: widget.person,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Spacing.spacingV12,
          ),
          SliverToBoxAdapter(
            child: FMListTile(
              icon: Icons.cake,
              title: L10n.of(context).sPersonInfoBirthday,
              subtitle: widget.person.dob.age.toString(),
            ),
          ),
          SliverToBoxAdapter(
            child: FMListTile(
              icon: Icons.email,
              title: L10n.of(context).sPersonInfoEmail,
              subtitle: widget.person.email,
              onTap: () => widget.onTapEmail(
                widget.person.email,
                widget.person.name.fullName,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FMListTile(
              icon: Icons.phone,
              title: L10n.of(context).sPersonInfoPhone,
              subtitle: widget.person.phone,
              onTap: () => widget.onTapPhone(widget.person.phone),
            ),
          ),
          SliverToBoxAdapter(
            child: FMListTile(
              icon: Icons.location_on,
              title: L10n.of(context).sPersonInfoLocation,
              subtitle:
                  '''${widget.person.location.city}, ${widget.person.location.country}''',
              onTap: () => widget.onTapCopy(
                '''${widget.person.location.city}, ${widget.person.location.country}''',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Spacing.spacingV24,
          ),
          SliverPadding(
            padding: FMPadding.paddingH24,
            sliver: SliverToBoxAdapter(
              child: Text(
                L10n.of(context).sPersonInfoMapView,
                style: TypoTitle.size24,
              ),
            ),
          ),
          SliverPadding(
            padding: FMPadding.padding_24,
            sliver: SliverToBoxAdapter(
              child: FMMap(
                location: widget.person.location.coordinates.position,
                markers: <Marker>{widget.person.location.coordinates.marker},
              ),
            ),
          ),
        ],
      );
}

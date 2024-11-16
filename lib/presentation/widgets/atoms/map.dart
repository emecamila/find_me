part of 'atoms.dart';

class FMMap extends StatefulWidget {
  const FMMap({
    required this.location,
    required this.markers,
    super.key,
  });

  final LatLng location;
  final Set<Marker> markers;

  @override
  State<FMMap> createState() => _FMMapState();
}

class _FMMapState extends State<FMMap> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: Layout.space300,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Layout.space16,
          ),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.location,
              zoom: Layout.space12,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {});
            },
            markers: widget.markers,
          ),
        ),
      );
}

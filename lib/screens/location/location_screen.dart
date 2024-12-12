import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});
  static const LatLng myCurrentLocation = LatLng(-6.990258, 110.413802);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Expanded(
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: myCurrentLocation, zoom: 10),
        ),
      ),
    );
  }
}

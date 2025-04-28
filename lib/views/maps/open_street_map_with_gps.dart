import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class OpenStreetMapWithGPS extends StatefulWidget {
  const OpenStreetMapWithGPS({super.key});

  @override
  _OpenStreetMapWithGPSState createState() => _OpenStreetMapWithGPSState();
}

class _OpenStreetMapWithGPSState extends State<OpenStreetMapWithGPS> {
  LatLng? _currentLocation;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("Service Enabled : $serviceEnabled");
    if (!serviceEnabled) {
      // Location services are not enabled, do nothing or ask the user
      return;
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      return;
    }
    print("trying to get current position ...");
    // Get current position
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    // Move the map to the user's location
    _mapController.move(_currentLocation!, 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OpenStreetMap with GPS')),
      body: _currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : SizedBox(
              width: 200,
              height: 200,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _currentLocation!,
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: _currentLocation!,
                        child: Icon(
                          Icons.my_location,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _determinePosition,
        child: Icon(Icons.my_location),
      ),
    );
  }
}

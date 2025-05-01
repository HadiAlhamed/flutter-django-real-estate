import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate/textstyles/text_colors.dart';
import 'package:real_estate/textstyles/text_styles.dart';
import 'package:real_estate/widgets/my_button.dart';

class PropertyDetailsPage extends StatefulWidget {
  const PropertyDetailsPage({super.key});

  @override
  State<PropertyDetailsPage> createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  LatLng? _currentLocation;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    // _determinePosition();
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
    //I/flutter ( 6957): 35.1867283
// I/flutter ( 6957): 35.9517433
    // Move the map to the user's location
    _mapController.move(_currentLocation!, 15.0);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: 90), // Prevent content from being hidden behind buttons
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/house.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Text("16,000 SP", style: h1TitleStyleBlack),
                ),
                Divider(),
                roomsInfo(),
                Divider(),
                propertyDetails(),
                const SizedBox(height: 20),
                getLocationTitle(),
                getFlutterMap(),
                const SizedBox(height: 5), // Extra space to avoid overlap
              ],
            ),
          ),

          // Fixed Bottom Buttons (Like bottomNavigationBar)
          buyRentBookBar(),
        ],
      ),
    );
  }

  Positioned buyRentBookBar() {
    return Positioned(
      bottom: 0, // Distance from the bottom of the screen
      left: 0,
      right: 0,
      child: Container(
        color: const Color.fromARGB(255, 238, 235, 235),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              fitParent: true,
              title: 'Buy Now',
              textStyle: buttonTextStylePrimary,
              buttonStyle: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 214, 167, 224),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: primaryColor,
                      width: 3,
                    ),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(12),
                ),
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
            MyButton(
                title: 'Rent Now',
                textStyle: buttonTextStylePrimary,
                buttonStyle: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 214, 167, 224),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: primaryColor,
                        width: 3,
                      ),
                    ),
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),
                fitParent: true),
            MyButton(title: 'Book tour', fitParent: true),
          ],
        ),
      ),
    );
  }

  Padding getLocationTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Row(
        children: [
          Icon(Icons.gps_fixed),
          const SizedBox(width: 10),
          Text("Location", style: h3TitleStyleBlack),
        ],
      ),
    );
  }

  Container getFlutterMap() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.none, // Disables all interactions
          ),
          initialCenter: LatLng(35.1867283, 35.9517433),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(35.1867283, 35.9517433),
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
    );
  }

  Padding propertyDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Property Details",
            style: h2TitleStyleBlack,
          ),
          const SizedBox(height: 15),
          Text(
            "a 200 square meter house with a backyard that has a pool and a playground for kids",
            style: h4TitleStyleBlack.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Padding roomsInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Flat in Lattakia Near Tishreen University With Beautiful View",
              style: h3TitleStyleBlack),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              detailInfo(Icons.bed, "2 beds"),
              detailInfo(Icons.bathtub, "2 bath"),
              detailInfo(Icons.aspect_ratio, "200 Sqm"),
            ],
          ),
        ],
      ),
    );
  }

  Row detailInfo(IconData iconData, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(iconData, color: primaryColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

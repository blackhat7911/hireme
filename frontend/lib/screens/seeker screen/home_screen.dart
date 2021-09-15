import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String username = "Bishal";
  final String imageUrl =
      "https://images.pexels.com/photos/7120688/pexels-photo-7120688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  final searchText = new TextEditingController();
  LatLng _center = LatLng(27.7172, 85.3240);
  String location = "";

  List<LatLng> _centers = [
    LatLng(27.7172, 85.3240),
    LatLng(39.9075, 116.39723),
    LatLng(27.7190, 85.3260),
    LatLng(27.7199, 85.3270),
    LatLng(27.7162, 85.3280),
  ];

  bool isPermissionGranted = false;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    print(Future.error('Location services are disabled.'));
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print(Future.error('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print(Future.error('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(Future.error(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    setState(() {
      isPermissionGranted = true;
    });
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    location =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    this._getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MyDrawer(
        fullname: username,
        imageUrl: imageUrl,
      ),
      body: SafeArea(
        child: isPermissionGranted == false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.5,
                      ),
                      mapType: MapType.hybrid,
                      zoomControlsEnabled: false,
                      myLocationEnabled: false,
                      compassEnabled: false,
                      markers: {
                        Marker(
                          markerId: MarkerId("1"),
                          position: _center,
                        ),
                      }),
                  Positioned(
                    top: 10,
                    child: MyAppbar(
                      size: size,
                      searchText: searchText,
                      imageUrl: imageUrl,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 20,
                    right: 0,
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _center = _centers[index];
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://images.unsplash.com/photo-1630943952377-8245275a4781?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                                      ),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "John Dore",
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Plumber",
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Kritipur",
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

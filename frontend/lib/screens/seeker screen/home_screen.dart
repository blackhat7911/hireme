import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/home_bloc/bloc/home_bloc.dart';
import 'package:frontend/data/repo/home_repo.dart';
import 'package:frontend/utils/constants/api_constants.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.username,
    required this.imageUrl,
    required this.location,
    required this.phone,
    this.id,
  }) : super(key: key);
  final String username;
  final String imageUrl;
  final String location;
  final String phone;
  final int? id;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchText = new TextEditingController();
  LatLng _center = LatLng(27.7172, 85.3240);
  String location = "";

  List<LatLng> _centers = [
    LatLng(27.7172, 85.3240),
    LatLng(27.6630, 85.2774),
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

  HomeRepository _homeRepository = new HomeRepository();

  @override
  void initState() {
    super.initState();
    _homeRepository.getWorkerList();
    this._getCurrentLocation();
  }

  List<Map<String, String>> _data = [
    {
      "name": "bishnu",
      "work": "plumber",
      "location": "balaju",
      "imageUrl":
          ApiConstants.baseUrl + '/' + "static/avtar/IMG_20210928_140336.jpg"
    },
    {
      "name": "manish",
      "work": "dish washer",
      "location": "thankot",
      "imageUrl": ApiConstants.baseUrl + '/' + "static/avtar/user_t5TQj4R.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MyDrawer(
        fullname: widget.username,
        imageUrl: ApiConstants.baseUrl + '/' + widget.imageUrl,
        id: widget.id!,
        phone: widget.phone,
        location: widget.location,
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
                      imageUrl: ApiConstants.baseUrl + '/' + widget.imageUrl,
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
                        itemCount: _data.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _center = _centers[index];
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        width: size.width * 0.8,
                                        height: size.height * 0.3,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 75,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    _data[index]["imageUrl"]!,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _data[index]["name"]!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _data[index]["work"]!,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomButton(
                                              onTap: () {
                                                Get.back();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Request sent successfully")));
                                              },
                                              title: "Book now",
                                              textColor: whiteColor,
                                              buttonColor: primaryColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
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
                                        _data[index]["imageUrl"]!,
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
                                          _data[index]["name"]!,
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
                                          _data[index]["work"]!,
                                          style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _data[index]["location"]!,
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

import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchText = new TextEditingController();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _center = CameraPosition(
    target: LatLng(27.700769, 85.300140),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _center,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              zoomControlsEnabled: false,
              compassEnabled: false,
              myLocationEnabled: true,
            ),
            MyAppbar(
              size: size,
              searchText: searchText,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
        backgroundColor: primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "Post A Job",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CustomInputBox(
                              title: "Title",
                              hint: "Job Title",
                              icon: Icons.work,
                              isInvisible: false,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CustomInputBox(
                              title: "Description",
                              hint: "Describe here...",
                              icon: Icons.edit,
                              isInvisible: false,
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            CustomInputBox(
                              title: "Location",
                              hint: "Location",
                              icon: Icons.location_city,
                              isInvisible: false,
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        title: "Post",
                        buttonColor: primaryColor,
                        textColor: whiteColor,
                        width: size.width,
                        onTap: () {
                          print("Posted");
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

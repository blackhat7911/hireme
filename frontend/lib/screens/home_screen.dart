import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchText = new TextEditingController();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.5,
              ),
              mapType: MapType.hybrid,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              compassEnabled: false,
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
                content: SingleChildScrollView(
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.8,
                    color: whiteColor,
                    child: Column(
                      children: [
                        Text(
                          "Post Work",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              CustomInputBox(
                                size: size,
                                title: "Title",
                                hint: "Title",
                                isInvisible: false,
                                icon: Icons.work,
                                suffixIcon: null,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomInputBox(
                                size: size,
                                title: "Location",
                                hint: "Location",
                                isInvisible: true,
                                icon: Icons.location_on,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomInputBox(
                                size: size,
                                title: "Description",
                                hint: "Description",
                                isInvisible: true,
                                icon: Icons.edit,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(
                          title: "Post",
                          textColor: whiteColor,
                          buttonColor: primaryColor,
                          onTap: () {
                            print('posted');
                          },
                        ),
                      ],
                    ),
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

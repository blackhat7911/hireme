import 'package:flutter/material.dart';
import 'package:frontend/models/login_model.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_input_box.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String username = "Bishal";
  final String imageUrl =
      "https://images.pexels.com/photos/7120688/pexels-photo-7120688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  @override
  void initState() {
    super.initState();
    // username = Hive.box('login').values.elementAt(0).username;
    // imageUrl = Hive.box('login').values.elementAt(0).imageUrl;
  }

  final searchText = new TextEditingController();
  static const LatLng _center = const LatLng(27.7172, 85.3240);
  final titleController = new TextEditingController();
  final location = new TextEditingController();
  final description = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MyDrawer(
        fullname: username,
        imageUrl: imageUrl,
      ),
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
              imageUrl: imageUrl,
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
                                controller: titleController,
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
                                controller: location,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              CustomInputBox(
                                  size: size,
                                  keyboardType: TextInputType.multiline,
                                  title: "Description",
                                  hint: "Description",
                                  icon: Icons.edit,
                                  controller: description),
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

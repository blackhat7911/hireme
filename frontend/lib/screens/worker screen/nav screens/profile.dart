import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/page_header.dart';
import 'package:get/get.dart';

class ProfileNavScreen extends StatefulWidget {
  final String imageUrl;
  final String phone;
  final String location;
  final String username;
  final int id;
  const ProfileNavScreen({
    Key? key,
    required this.imageUrl,
    required this.phone,
    required this.location,
    required this.username,
    required this.id,
  }) : super(key: key);

  @override
  _ProfileNavScreenState createState() => _ProfileNavScreenState();
}

class _ProfileNavScreenState extends State<ProfileNavScreen> {
  bool _isActive = true;
  final String imageUrl =
      "https://images.pexels.com/photos/7120688/pexels-photo-7120688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";

  void changeStatus(bool status) {
    if (status == true) {
      setState(() {
        _isActive = status;
      });
    } else if (status == false) {
      setState(() {
        _isActive = status;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(title: "Profile"),
              SizedBox(height: 40),
              Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        widget.imageUrl,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      widget.username,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Text(
                              "Online Status",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Switch(
                              value: _isActive,
                              activeColor: Colors.green,
                              activeTrackColor: Colors.green.withOpacity(0.6),
                              inactiveThumbColor: Colors.red,
                              inactiveTrackColor: Colors.red.withOpacity(0.6),
                              onChanged: changeStatus,
                            ),
                          ),
                          SizedBox(height: 10),
                          ListTile(
                            leading: Text(
                              "General Information",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Contact"),
                            trailing: Text(widget.phone),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Location"),
                            trailing: Text(widget.location),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                buttonColor: primaryColor,
                onTap: () {
                  Get.back();
                },
                textColor: whiteColor,
                title: "Logout",
                width: size.width * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

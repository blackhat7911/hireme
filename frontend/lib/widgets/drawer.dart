import 'package:flutter/material.dart';
import 'package:frontend/screens/auth_screens/login_screen.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/screens/seeker%20screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyDrawer extends StatelessWidget {
  final int id;
  final String fullname, imageUrl, phone, location;
  const MyDrawer({
    Key? key,
    required this.imageUrl,
    required this.phone,
    required this.location,
    required this.fullname,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  fullname,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                )
              ],
            ),
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SeekerProfileScreen(
                            id: id,
                            imageUrl: imageUrl,
                            username: fullname,
                            location: location,
                            phone: phone,
                          )));
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Get.to(() => LoginScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}

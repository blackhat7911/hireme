import 'package:flutter/material.dart';
import 'package:frontend/screens/seeker%20screen/home_screen.dart';
import 'package:frontend/screens/seeker%20screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MyDrawer extends StatelessWidget {
  final String? fullname, imageUrl;
  const MyDrawer({
    Key? key,
    this.imageUrl,
    this.fullname,
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
                    imageUrl!,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  fullname!,
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
                      builder: (context) => SeekerProfileScreen()));
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Hive.box('login').clear();
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}

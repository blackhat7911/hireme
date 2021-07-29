import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart';
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
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Post A Work'),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Icon(Icons.logout),
                  SizedBox(
                    width: 30,
                  ),
                  Text('Logout'),
                ],
              ),
            ),
            onTap: () {
              Hive.box('login').clear();
              Navigator.pushNamed(context, loginRoute);
            },
          ),
        ],
      ),
    );
  }
}

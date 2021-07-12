import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/7120688/pexels-photo-7120688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            title: Text('Post Job'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/screens/worker%20screen/nav%20screens/history.dart';
import 'package:frontend/screens/worker%20screen/nav%20screens/home.dart';
import 'package:frontend/screens/worker%20screen/nav%20screens/profile.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class WorkerHome extends StatefulWidget {
  const WorkerHome({
    Key? key,
    required this.imageUrl,
    required this.phone,
    required this.location,
    required this.username,
    required this.id,
  }) : super(key: key);
  final String imageUrl;
  final String phone;
  final String location;
  final String username;
  final int id;
  @override
  _WorkerHomeState createState() => _WorkerHomeState();
}

class _WorkerHomeState extends State<WorkerHome> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        SeekerNavHome(),
        HistoryNavScreen(),
        ProfileNavScreen(
          username: widget.username,
          phone: widget.phone,
          imageUrl: widget.imageUrl,
          location: widget.location,
          id: widget.id,
        ),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: SnakeNavigationBar.color(
        currentIndex: _selectedIndex,
        elevation: 1,
        snakeViewColor: primaryColor,
        snakeShape: SnakeShape.indicator,
        backgroundColor: whiteColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: blackColor,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

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
            MyAppbar(
              size: size, 
              searchText: searchText,
            ),
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.5
              )
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
        onPressed: (){
         showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                content: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.8,
                  color: whiteColor,
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              );
            }
          );
        },
      ),
    );
  }
}


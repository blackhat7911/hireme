import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({
    Key? key,
    required this.size,
    required this.searchText,
    this.imageUrl,
  }) : super(key: key);

  final Size size;
  final TextEditingController searchText;
  final String? imageUrl;

  @override
  _MyAppbarState createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  Color generateRandomColor1() {
    // Define all colors you want here
    const predefinedColors = [
      Colors.purple,
      Colors.green,
      Colors.blue,
      Colors.black,
      Colors.white
    ];
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: whiteColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: inputBoxColor),
              child: TextFormField(
                controller: widget.searchText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Here...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            backgroundColor: generateRandomColor1(),
            radius: 25,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.imageUrl!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

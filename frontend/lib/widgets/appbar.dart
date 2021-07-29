import 'package:flutter/material.dart';
import 'package:frontend/utils/constants/constants.dart';

class MyAppbar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
          Container(
            width: size.width * 0.70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: inputBoxColor),
            child: TextFormField(
              controller: searchText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Here...",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl!,
            ),
          ),
        ],
      ),
    );
  }
}

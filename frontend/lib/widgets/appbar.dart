import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key? key,
    required this.size,
    required this.searchText, 
  }) : super(key: key);

  final Size size;
  final TextEditingController searchText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
          SizedBox(width: 10.0,),
          Container(
            width: size.width * 0.70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: inputBoxColor
            ),
            child: TextFormField(
              controller: searchText,
              decoration: InputDecoration(
                hintText: "Search Here...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
              ),
            ),
          ),
          SizedBox(width: 5.0,),
          CircleAvatar(
            backgroundImage: NetworkImage("https://images.pexels.com/photos/7120688/pexels-photo-7120688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
          ),
        ],
      ),
    );
  }
}
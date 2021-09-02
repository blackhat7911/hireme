import 'package:flutter/material.dart';
import 'package:frontend/screens/worker%20screen/order_details.dart';
import 'package:frontend/utils/constants/constants.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.size,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    this.completedDate,
    this.isVisible = false,
    // required this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final String date;
  final String? completedDate;
  final String location;
  final Size size;
  final bool? isVisible;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: "Location: ",
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: "Posted:",
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isVisible!,
            child: RichText(
              text: TextSpan(
                  text: "Completed: ",
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: completedDate,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailsScreen())),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "View Details",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}

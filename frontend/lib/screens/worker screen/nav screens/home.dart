import 'package:flutter/material.dart';
import 'package:frontend/screens/worker%20screen/order_details.dart';
import 'package:frontend/utils/constants/constants.dart';
import 'package:frontend/widgets/order_card.dart';
import 'package:frontend/widgets/page_header.dart';

class SeekerNavHome extends StatefulWidget {
  const SeekerNavHome({Key? key}) : super(key: key);

  @override
  _SeekerNavHomeState createState() => _SeekerNavHomeState();
}

class _SeekerNavHomeState extends State<SeekerNavHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: "Orders",
                ),
                SizedBox(
                  height: 20,
                ),
                OrderCard(
                  size: size,
                  date: '12th Aug, 2021',
                  description:
                      'lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
                  title: 'Plumber required for pipe repair',
                  location: 'Kathmandu, Nepal',
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => OrderDetailsScreen()));
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

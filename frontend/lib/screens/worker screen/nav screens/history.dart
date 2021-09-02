import 'package:flutter/material.dart';
import 'package:frontend/widgets/order_card.dart';
import 'package:frontend/widgets/page_header.dart';

class HistoryNavScreen extends StatefulWidget {
  const HistoryNavScreen({Key? key}) : super(key: key);

  @override
  _HistoryNavScreenState createState() => _HistoryNavScreenState();
}

class _HistoryNavScreenState extends State<HistoryNavScreen> {
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
                PageHeader(title: "History"),
                SizedBox(
                  height: 20,
                ),
                OrderCard(
                  size: size,
                  isVisible: true,
                  date: '12nd Aug, 2021',
                  description:
                      'lLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
                  title: 'Plumber required for pipe repair',
                  location: 'Bengaluru',
                  completedDate: "13rd Aug, 2021",
                  // onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

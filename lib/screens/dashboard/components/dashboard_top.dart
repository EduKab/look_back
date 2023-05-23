import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

const double defaultPadding = 16.0;

class DashboardTop extends StatelessWidget {
  const DashboardTop({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome to S O C I A L T E C",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: defaultPadding),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 8,
        //       child: LottieBuilder.asset(
        //         "assets/animation/cute_2.json",
        //         height: 350,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
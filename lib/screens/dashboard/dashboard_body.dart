import 'package:flutter/material.dart';

class DashboardTop extends StatelessWidget {
  const DashboardTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Welcome to look back",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const IntrinsicWidth(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('data')
          // ElevatedButton.icon(
          //   icon: const Icon(Icons.brightness_6_rounded),
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/theme');
          //   },
          //   label: const Text("Themes"),
          // ),
          
          // const SizedBox(height: 16),
          // ElevatedButton.icon(
          //   icon: const Icon(Icons.supervised_user_circle_sharp),
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return ProfileScreen(
          //             data: widget.data,
          //           );
          //         },
          //       ),
          //     );
          //   },
          //   label: const Text("Profile"),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.grey,
          //     //onPrimary: Colors.black,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // ElevatedButton.icon(
          //   icon: const Icon(Icons.logout),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   label: const Text("Sign Out"),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.redAccent,
          //     //onPrimary: Colors.black,
          //   ),
          // ),
        ],
      ),
    );
  }
}

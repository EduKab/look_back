import 'package:flutter/material.dart';

import '../profile/profile_screen.dart';

class DashboardBody4 extends StatelessWidget {
  const DashboardBody4({super.key, required this.data});

  final List<String?> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.brightness_6_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/theme');
                    },
                    label: const Text("Themes"),
                  ),
                  
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.supervised_user_circle_sharp),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen(
                              data: data,
                            );
                          },
                        ),
                      );
                    },
                    label: const Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      //onPrimary: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text("Sign Out"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      //onPrimary: Colors.black,
                    ),
                  ),
                ],
                ),
            );
  }
}
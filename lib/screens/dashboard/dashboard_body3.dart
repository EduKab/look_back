import 'package:flutter/material.dart';

import '../profile/profile_screen.dart';

class DashboardBody3 extends StatefulWidget {
  DashboardBody3({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardBody3> createState() => _DashboardBody3State();
}

class _DashboardBody3State extends State<DashboardBody3> {
  @override
  Widget build(BuildContext context) {

    return Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.data[1]!),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: TextEditingController(text: widget.data[0]),
                    focusNode: FocusNode(),
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.blueGrey)
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: TextEditingController(text: widget.data[2]),
                    focusNode: FocusNode(),
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.blueGrey)
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: TextEditingController(text: widget.data[3]),
                    focusNode: FocusNode(),
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.blueGrey)
                  ),
                  SizedBox(height: 40),
                   ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen(
                              data: widget.data,
                            );
                          },
                        ),
                      );
                    },
                    label: const Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      //onPrimary: Colors.black,
                    ),
                  ),
                ],
              ),
            );
  }
}
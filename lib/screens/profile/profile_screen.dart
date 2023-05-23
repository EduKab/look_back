import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.data});

  final List<String?> data;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile ${widget.data[3]}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.data[1]!),
              radius: 40,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 20),
            Text(widget.data[0]!),
            const SizedBox(height: 20),
            Text(widget.data[2]!),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}

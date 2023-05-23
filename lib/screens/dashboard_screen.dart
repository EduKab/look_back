import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            inactiveColor: Colors.black,
            activeColor: Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: Text('Shop'),
            icon: Icon(Icons.view_module),
            inactiveColor: Colors.black,
            activeColor: Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
            inactiveColor: Colors.black,
            activeColor: Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: Text('Settings'),
            icon: Icon(Icons.settings),
            inactiveColor: Colors.black,
            activeColor: Color.fromARGB(255, 255, 53, 120)
          ),
        ],
      ),
    );
  }
}
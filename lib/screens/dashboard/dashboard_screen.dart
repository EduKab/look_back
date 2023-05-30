import 'package:flutter/material.dart';
import 'package:look_back/screens/dashboard/home_screen.dart';
import 'package:look_back/screens/products/products_screen.dart';
import 'package:look_back/screens/profile/profile_screen.dart';
import 'package:look_back/screens/theme/theme_screen.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

List<String?> session = List.empty();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.data});

  final List<String?> data;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  int _currentIndex = 0;
  bool isEdit = false;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    session = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: const [
          Responsive(
            mobile: MobileDashboardScreen1(),
            desktop: DesktopDashboardScreen1()
          ),
          Responsive(
            mobile: MobileDashboardScreen2(),
            desktop: DesktopDashboardScreen2()
          ),
          Responsive(
            mobile: MobileDashboardScreen3(),
            desktop: DesktopDashboardScreen3()
          ),
          Responsive(
            mobile: MobileDashboardScreen4(),
            desktop: DesktopDashboardScreen4()
          ),
        ]
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => {
          setState(() => _currentIndex = index),
          _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300), curve: Curves.ease)
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text('Home'),
            icon: const Icon(Icons.home),
            inactiveColor: Colors.black,
            activeColor: const Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: const Text('Shop'),
            icon: const Icon(Icons.view_module),
            inactiveColor: Colors.black,
            activeColor: const Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: const Text('Profile'),
            icon: const Icon(Icons.person),
            inactiveColor: Colors.black,
            activeColor: const Color.fromARGB(255, 255, 53, 120)
          ),
          BottomNavyBarItem(
            title: const Text('Settings'),
            icon: const Icon(Icons.settings),
            inactiveColor: Colors.black,
            activeColor: const Color.fromARGB(255, 255, 53, 120)
          ),
        ],
      ),
    );
  }
}

class MobileDashboardScreen1 extends StatelessWidget {
  const MobileDashboardScreen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Look Back'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
      ),
      body: const HomeScreen()
    );
  }
}

class MobileDashboardScreen2 extends StatefulWidget {
  const MobileDashboardScreen2({super.key});

  @override
  State<MobileDashboardScreen2> createState() => _MobileDashboardScreen2State();
}

class _MobileDashboardScreen2State extends State<MobileDashboardScreen2> {
        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
      ),
      body: const ProductsScreen(),
      floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.pushNamed(context, '/addProduct').then((value) {
              setState(() { });
            });
          }),
          child: const Icon(Icons.add_outlined),
        ),
    );
  }
}

class MobileDashboardScreen3 extends StatefulWidget {
  const MobileDashboardScreen3({super.key});

  @override
  State<MobileDashboardScreen3> createState() => _MobileDashboardScreen3State();
}

class _MobileDashboardScreen3State extends State<MobileDashboardScreen3> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Profile'),
              backgroundColor: Colors.pink,
              automaticallyImplyLeading: false,
            ),
            body: ProfileScreen(data: session)
          );
  }
}

class MobileDashboardScreen4 extends StatelessWidget {
  const MobileDashboardScreen4({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.pink,
            ),
            body: const ThemeScreen()
    );
  }
}

class DesktopDashboardScreen1 extends StatelessWidget {
  const DesktopDashboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 450,
                  child: HomeScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopDashboardScreen2 extends StatelessWidget {
  const DesktopDashboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: ProductsScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DesktopDashboardScreen3 extends StatelessWidget {
  const DesktopDashboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: ProfileScreen(data: session),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DesktopDashboardScreen4 extends StatelessWidget {
  const DesktopDashboardScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: ThemeScreen(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

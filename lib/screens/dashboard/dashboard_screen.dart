import 'package:bottom_navy_bar/bottom_navy_bar.dart';
<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';

import '../profile/profile_screen.dart';
import 'components/dashboard_body.dart';
import 'components/dashboard_top.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:look_back/settings/responsive.dart';
import 'package:look_back/components/background.dart';

import '../../models/product_model.dart';
import '../profile/profile_screen.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream

=======
  
>>>>>>> Stashed changes
  @override
  void initState() {
    super.initState();
    session = widget.data;
  }

  Stream<List<Product>> readProducts() {
    return FirebaseFirestore.instance
    .collection('products')
    .snapshots()
    .map((event) =>
        event.docs.map((e) => Product.fromJson(e.data())).toList());
  } 


  @override
  Widget build(BuildContext context) {
    print(widget.data[3]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
<<<<<<< Updated upstream
<<<<<<< Updated upstream
              title: Text('NEWS'),
=======
              title: Text(
                'NEWS',
                style: TextStyle(
                  fontFamily: 'Decipher',
                  fontSize: 18
                ),
              ),
>>>>>>> Stashed changes
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOOK BACK NEWS', 
                          style: TextStyle(
                            fontFamily: 'KAFEINE',
                            fontSize: 30
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WHAT IS LOOK BACK?',
                          style: TextStyle(
                            fontFamily: 'KAFEINE',
                            fontSize: 20
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: 
                          Text(
                            'Look Back is a clothing shop where you can find more variety that anyone shop in the world. We have clothing brand like Mezcal, Problems, New Era and much others, but the more importan clothing brand is our, you can find clothes of our brand Look Back.',
                            textAlign: TextAlign.justify,
<<<<<<< Updated upstream
=======
                            style: TextStyle(
                              fontFamily: 'Rochaline',
                              fontSize: 20
                            ),
>>>>>>> Stashed changes
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/content/Playera Mezcal - Creation.png',
                          height: 200,
                          width: 200,
                        ),
                        Flexible(
                          child: Text(
                            'New clothes arrive each week!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Soulgood',
                              fontSize: 20
                            ),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    ImageSlideshow(
                      width: double.infinity,
                      height: 200,
                      initialPage: 0,
                      indicatorColor: Colors.pink,
                      indicatorBackgroundColor: Colors.grey,
                      autoPlayInterval: 5000,
                      isLoop: true,
                      children: [
                        Image.asset(
                          'assets/images/content/Carrousel1.jpeg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/content/Carrousel2.jpeg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/content/Carrousel3.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CONTACT US',
                          style: TextStyle(
                            fontFamily: 'KAFEINE',
                            fontSize: 20
                          )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Instagram icon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
<<<<<<< Updated upstream
                        Text('@lookback.mx')
=======
                        Text(
                          '@lookback.mx',
                          style: TextStyle(
                              fontFamily: 'Rochaline',
                              fontSize: 20
                            ),
                        )
>>>>>>> Stashed changes
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Facebook icon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
<<<<<<< Updated upstream
                        Text('Look Back')
=======
                        Text(
                          'Look Back',
                          style: TextStyle(
                              fontFamily: 'Rochaline',
                              fontSize: 20
                            ),
                        )
>>>>>>> Stashed changes
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/icons/Whatsapp icon.png',
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
<<<<<<< Updated upstream
                        Text('+524611234567')
=======
                        Text(
                          '+524611234567',
                          style: TextStyle(
                              fontFamily: 'Rochaline',
                              fontSize: 20
                            ),
                        )
>>>>>>> Stashed changes
                      ],
                    )
                  ],
                ),
<<<<<<< Updated upstream
=======
              title: Text('LookBack'), 
              automaticallyImplyLeading: false
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NEWS')
              ],
            ),
          ),
          Container(color: Colors.black),
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: [
                (isEdit)
                ? Container()
                : IconButton(
                    onPressed: (){
                      setState(() {
                        isEdit =! isEdit;
                        print(isEdit);
                      });
                    }, 
                    icon: Icon(Icons.edit)
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: (isEdit)
                      ? Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 150, left: 110),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), 
                            color: Colors.red
                          ),
                          child: IconButton(
                            onPressed: (){
                              
                            }, 
                            icon: Icon(Icons.edit, color: Colors.white)
                          ),
                        )
                      : Container()
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: TextEditingController(text: widget.data[2]),
                    focusNode: FocusNode(),
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: (isEdit)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.blueGrey)
                  ),
                  SizedBox(height: 10),
                  TextField(
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )
                  ),
                  SizedBox(height: 10),
                  TextField(
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    )
                  ),
                  SizedBox(height: 40),
                  (isEdit)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.green),
                          ),
                          onPressed: (){}, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.save, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: (){
                            isEdit =! isEdit;
                            setState(() {});
                          }, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.close_sharp, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                      ],
                    )
                  : Container()
                ],
              ),
            ),
          ),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => {
          setState(() => _currentIndex = index),
          _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease)
        },
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
    
    /*return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.data[0]!),
              accountEmail: Text(widget.data[2]!),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget.data[1]!),
                radius: 40,
                backgroundColor: Colors.transparent,
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
<<<<<<< Updated upstream
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              title: Text('SHOP'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2, 
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Image.asset('assets/images/content/Playera Amantis - Dogs.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Creation.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Suggar.png'),
                      Image.asset('assets/images/content/Playera Amantis - Dogs.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Creation.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Suggar.png'),
                      Image.asset('assets/images/content/Playera Amantis - Dogs.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Creation.png'),
                      Image.asset('assets/images/content/Playera Mezcal - Suggar.png'),
                    ]
                  ),
                ]
              ),
            )
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('PROFILE'),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              actions: [
                (isEdit)
                ? Container()
                : IconButton(
                    onPressed: (){
                      setState(() {
                        isEdit =! isEdit;
                        print(isEdit);
                        /*if(widget.data[3] == 'Default'){
                          isEdit =! isEdit;
                          print(isEdit);
                        }else{
                          AlertDialog(
                              actions: [
                                TextButton(onPressed: (){}, child: Text('Aceptar'))
                              ],
                              content: Text('Solo se puede editar el perfil con las cuentas logueadas con correo electronico. :('),
                          );
                        }*/
                      });
                    }, 
                    icon: Icon(Icons.edit)
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.data[1]!),
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: (isEdit)
                      ? Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 150, left: 110),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), 
                            color: Colors.red
                          ),
                          child: IconButton(
                            onPressed: (){
                              
                            }, 
                            icon: Icon(Icons.edit, color: Colors.white)
                          ),
                        )
                      : Container()
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: TextEditingController(text: widget.data[0]!),
                    focusNode: FocusNode(),
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style:(isEdit)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.grey)
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: TextEditingController(text: widget.data[2]!),
                    focusNode: FocusNode(),
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style:(isEdit)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.grey)
                  ),
                  SizedBox(height: 40),
                  (isEdit)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.green),
                          ),
                          onPressed: (){}, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.save, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: (){
                            isEdit =! isEdit;
                            setState(() {});
                          }, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.close_sharp, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                      ],
                    )
                  : Container()
                ],
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('Settings'),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            ),
            body: Column(
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
                            data: widget.data,
                          );
                        },
                      ),
                    );
                  },
                  label: const Text("Profile"),
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
=======
              actions: [
                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/addProduct');
                  }, 
                  icon: Icon(Icons.add)
                )
              ],
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              title: Text(
                'SHOP',
                style: TextStyle(
                  fontFamily: 'Decipher',
                  fontSize: 18
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: readProducts(),
                      builder: (context, snapshot) {
                        //print('products:' + read().toString());
                        if(snapshot.hasData){
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .8,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 20),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                      fontFamily: 'Soulgood',
                                      fontSize: 20
                                    ),
                                  ),
                                  InstaImageViewer(child: Image.network(snapshot.data![index].url, height: 175, width: 175)),
                                  Text('\$${snapshot.data![index].price}'),
                                ],
                              );
                            }
                          );
                        }else{
                          return const CircularProgressIndicator();
                        }
                      }
                    ),
                  ]
                ),
              ),
            )
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'PROFILE',
                style: TextStyle(
                  fontFamily: 'Decipher',
                  fontSize: 18
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              actions: [
                (isEdit)
                ? Container()
                : IconButton(
                    onPressed: (){
                      setState(() {
                        isEdit =! isEdit;
                        print(isEdit);
                        /*if(widget.data[3] == 'Default'){
                          isEdit =! isEdit;
                          print(isEdit);
                        }else{
                          AlertDialog(
                              actions: [
                                TextButton(onPressed: (){}, child: Text('Aceptar'))
                              ],
                              content: Text('Solo se puede editar el perfil con las cuentas logueadas con correo electronico. :('),
                          );
                        }*/
                      });
                    }, 
                    icon: Icon(Icons.edit)
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.data[1]!),
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: (isEdit)
                      ? Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(top: 150, left: 110),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), 
                            color: Colors.red
                          ),
                          child: IconButton(
                            onPressed: (){
                              
                            }, 
                            icon: Icon(Icons.edit, color: Colors.white)
                          ),
                        )
                      : Container()
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: TextEditingController(text: widget.data[0]!),
                    focusNode: FocusNode(),
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style:(isEdit)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.grey)
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: TextEditingController(text: widget.data[2]!),
                    focusNode: FocusNode(),
                    enabled: (isEdit)
                    ? true
                    : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style:(isEdit)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.grey)
                  ),
                  SizedBox(height: 40),
                  (isEdit)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.green),
                          ),
                          onPressed: (){}, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'SAVE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.save, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: (){
                            isEdit =! isEdit;
                            setState(() {});
                          }, 
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.close_sharp, color: Colors.white)
                              ],
                            ),
                          )
                        ),
                      ],
                    )
                  : Container()
                ],
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(
                'SETTINGS',
                style: TextStyle(
                  fontFamily: 'Decipher',
                  fontSize: 18
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
            ),
            body: Padding(
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
                              data: widget.data,
                            );
                          },
                        ),
                      );
                    },
                    label: const Text("Profile"),
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
            ),
>>>>>>> Stashed changes
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => {
          setState(() => _currentIndex = index),
          _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease)
        },
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
<<<<<<< Updated upstream
    );*/
=======
    );
>>>>>>> Stashed changes
  }
}

/*class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const DashboardTop(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: DashboardBody(data: session),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}*/

/*class DesktopDashboardScreen extends StatelessWidget {
  const DesktopDashboardScreen({super.key});

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
                child: DashboardBody(data: session),
              ),
            ],
          ),
        ),
      ],
    );
  }
}*/

class GetCache{
  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }
}
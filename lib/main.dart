import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:look_back/screens/messaging/firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  
  print('WeeeeEEE');
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //////////////////////////////////////////
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('-> Inicia');
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // print('-> BackgroundMessage');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  //////////////////////////////////////////

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData? getCurrentTheme(ModelTheme themeNotifier) {
      int nTheme = themeNotifier.chooseTheme;
      List<ThemeData> lista = [
        lightTheme,
        darkTheme,
        pinkTheme,
        darkBlueTheme,
        purpleTheme
      ];
      return lista[nTheme];
    }

    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'L O O K - B A C K',
          theme: getCurrentTheme(themeNotifier),
          routes: getApplicationRoutes(),


          // home: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       ElevatedButton(
          //           onPressed: () async {
          //             print('chiiiiiiiii');
          //             //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
          //             FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          //               print('Got a message whilst in the foreground!');
          //               print('Message data: ${message.data}');
          //               if (message.notification != null) {
          //                 print('Message also contained a notification: ${message.notification}');
          //               }
          //             });
          //           },
          //           child: Text('Subscribe To Topic')),
          //       ElevatedButton(
          //           onPressed: () async {
          //             await FirebaseMessaging.instance
          //                 .unsubscribeFromTopic('myTopic');
          //           },
          //           child: Text('un Subscribe To Topic')),
          //     ],
          //   ),
          // ),


        );
      }),
    );
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:look_back/settings/notifications.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/firebase_options.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/routes.dart';

// showNotification(String title, String body) async {
//   print('hehe');
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//   );
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high channel',
//     'Very important notification!!',
//     description: 'the first notification',
//     importance: Importance.max,
//   );
//   await flutterLocalNotificationsPlugin.show(
//     1,
//     title,
//     body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(channel.id, channel.name,
//           channelDescription: channel.description),
//     ),
//   ).then((value) => print('notificacion mostrada'));
// }

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   //await Firebase.initializeApp();
//   showNotification(message.notification!.title!, message.notification!.body!);
//   print("Handling a background message: ${message.messageId}");
//   print("Title: ${message.notification!.title}");
// }

Notifications notifications = Notifications();

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  notifications.sendNotification(
        'eeee', 'iuiuiuiui');
  print('Got a message whilst in the foreground!');
  print('backgroundMessageHandler');
  if (message.notification != null) {
    print('Notification Title: ${message.notification!.title}');
    print('Notification Body: ${message.notification!.body}');
    notifications.sendNotification(
        message.notification!.title!, message.notification!.body!);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('-> Inicia');
  //////////////////////////////////////////

  notifications.initNotifications();
  final fcm = await FirebaseMessaging.instance.getToken();
  print(fcm);
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  //////////////////////////////////////////
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('onMessage');
      if (message.notification != null) {
        print('Notification Title: ${message.notification!.title}');
        print('Notification Body: ${message.notification!.body}');
        notifications.sendNotification(
            message.notification!.title!, message.notification!.body!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('onMessageOpenedApp');
      if (message.notification != null) {
        print('Notification Title: ${message.notification!.title}');
        print('Notification Body: ${message.notification!.body}');
        notifications.sendNotification(
            message.notification!.title!, message.notification!.body!);
      }
    });
  }

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
        );
      }),
    );
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/firebase_options.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/routes.dart';

showNotification() async {
  print('hehe');
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  print('hehe x2');
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high channel',
    'Very important notification!!',
    description: 'the first notification',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin.show(
    1,
    'my first notification',
    'a very long message for the user of app',
    NotificationDetails(
      android: AndroidNotificationDetails(channel.id, channel.name,
          channelDescription: channel.description),
    ),
  ).then((value) => print('acaday'));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('-> Inicia');
  //////////////////////////////////////////

  final fcm = await FirebaseMessaging.instance.getToken();
  print(fcm);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
      print('Notification Body: ${message.notification!.body}');
      showNotification();
    }
  });

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

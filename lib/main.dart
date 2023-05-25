import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:look_back/settings/firebase_options.dart';
import 'package:look_back/settings/theme_config.dart';
import 'package:look_back/settings/model_theme.dart';
import 'package:look_back/settings/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('-> Inicia');
  //////////////////////////////////////////

  final fcm = await FirebaseMessaging.instance.getToken();
  print(fcm);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
      print('Notification Body: ${message.notification!.body}');
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
        );
      }),
    );
  }
}

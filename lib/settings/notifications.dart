import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high);

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      notificationDetails,
    ).then((value) => print('notificacion mostrada'));
  }

}
import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebasePushNotifications {
  final firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
  );
  final StreamController<ReceivedNotification>
      didReceiveLocalNotificationStream =
      StreamController<ReceivedNotification>.broadcast();
  final NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails("crusoe_notification", "crusoe",
        importance: Importance.max, priority: Priority.high),
  );

  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling a background message: ${message.messageId}');
  }

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
        FirebaseMessaging.instance.subscribeToTopic("xyz123");
                FirebaseMessaging.instance.subscribeToTopic("123456");

        // FirebaseMessaging.instance.unsubscribeFromTopic("xyz123");
    notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          //selectNotificationStream.add(notificationResponse.payload);
          onTapNotification(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          onTapNotification(notificationResponse.payload);
          break;
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      FirebaseMessaging.instance.getInitialMessage().then((value) => {});
      onTapNotification(json.encode(message.data));
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("event message $event");
      display(remoteMessage: event);
    });
  }

  Future onTapNotification(String? payload) async {
    Map data = json.decode(payload!);
    print("on tap data $data");
    final infoData = data["info"] ?? {};
  }

  Future<void> display({required RemoteMessage remoteMessage}) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      await notificationsPlugin.show(id, remoteMessage.notification!.title,
          remoteMessage.notification!.body, notificationDetails,
          payload: json.encode(remoteMessage.data));
    } catch (err, str) {
      print('ERR=>lllll $err - $str');
    }
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

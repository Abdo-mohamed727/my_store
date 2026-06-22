import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_store/core/notification/services/local_notification_services.dart';

class PushNotificationServices {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static Future<void> init() async {
    await _fcm.requestPermission();

    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final String? token = await _fcm.getToken();
    log(token ?? 'no token');
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessages);
    // Foreground messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('message received in foreground: ${message.messageId}');
      LocalNotificationServices.showNotification(message);
    });
  }

  @pragma('vm:entry-point')
  static Future<void> handleBackGroundMessages(RemoteMessage message) async {
    log("handleBackGroundMessages ${message.notification?.title}");
  }

  static Future<void> handleForegroundMessage(RemoteMessage message) async {
    log('message received in foreground: ${message.messageId}');
    LocalNotificationServices.showNotification(message);
  }
}

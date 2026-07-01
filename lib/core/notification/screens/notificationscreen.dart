import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_store/core/notification/services/push_notification_services.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await PushNotificationServices.init();
          },
          child: const Text('Subscribe'),
        ),
      ),
    );
  }
}
//cTCiC93HSiWhDFcCbS7wxk:APA91bE0dTj85oXcTL2KFCNz7JutWGU0vRKCM0Rp48YOOeTTxOl8hRsRT_i2BPgUbntS_3HdcdMoZMGWiqbJ4rWoXokD-vdR8fSmuY6HLaKSgPzHTLF859c
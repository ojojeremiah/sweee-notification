import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';
import 'package:untitled2/service/storage_service.dart';

import '../model/notifications_model.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

class Notifier extends GetxController {
  var receivedNotifications = <ReceivedNotification>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNotifications();
  }
  void fetchNotifications() async {
    isLoading(true);
    ReceivedNotification notificationsList =
        await StorageService().getNotifications();
  }
}

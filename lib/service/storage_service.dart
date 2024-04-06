import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/model/notifications_model.dart';

class StorageService {
  static final StorageService _manager = StorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  SharedPreferences? _prefs;

  factory StorageService() => _manager;

  Future<void> _ensurePrefsLoaded() async {
    if (_manager._prefs == null) {
      _manager._prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> saveUserNotifications(ReceivedNotification notification) async {
    await _manager._storage.write(key: "title", value: notification.title!);
    await _manager._storage
        .write(key: "id", value: notification.id!.toString());
    await _manager._storage
        .write(key: "date", value: notification.date.toString());
    // await _manager._storage
    //     .write(key: "date", value: notification.date!.toIso8601String());
    await _manager._storage.write(key: "body", value: notification.body!);
    await _manager._storage.write(key: "payload", value: notification.payload!);
    if (notification.image != null) {
      await _manager._storage
          .write(key: "Image_url", value: notification.image!);
    }
  }

  Future<ReceivedNotification> getNotifications() async {
    ReceivedNotification notifications = ReceivedNotification(
        id: int.parse(_manager._storage.read(key: "id").toString()),
        title: await _manager._storage.read(key: "title") ?? "",
        payload: await _manager._storage.read(key: "payload") ?? "",
        body: await _manager._storage.read(key: "body") ?? "",
        image: await _manager._storage.read(key: "image") ?? "",
        date: await _manager._storage.read(key: "date") ?? ""
        // date: DateTime.parse(_manager._storage.read(key: 'date').toString()),
        );
    return notifications;
  }

  Future<String> getValue({required String key}) async {
    var value = await _manager._storage.read(key: key);
    return value!;
  }

  Future<bool> deleteFromStorage({required String key}) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();

    await storage.delete(key: key);
    return true;
  }

  StorageService._internal();
}

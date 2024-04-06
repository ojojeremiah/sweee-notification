import 'package:flutter/material.dart';
import 'package:untitled2/controller/local_notifications.dart';
import 'package:untitled2/screen/notifications_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return MaterialApp(
            theme: ThemeData(),
            home: Notifications(),
          );
        });
  }
}

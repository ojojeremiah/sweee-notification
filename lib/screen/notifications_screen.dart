import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/controller/local_notifications.dart';
import 'package:untitled2/model/notifications_model.dart';
import '../controller/notifications_controller.dart';
import '../theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // final date = DateTime.parse("May 5, 2023 at 7:30PM");
  final Notifier notifications = Get.put(Notifier());
  late String payload;
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

  listenToNotifications() {
    print("Listening to Notificationn");
    payload = "";
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Notifications()));
    });
  }

//  markAsRead(){}
//  deleteAll(){}
//   int current = 0;
//   final List<Widget> screens = [

//     const deleteAll(),
//   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.cardColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.primaryColor,
                  )),
              const Text(
                "Notifications",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              PopupMenuButton(
                  iconColor: AppColors.primaryColor,
                  color: AppColors.backgroundColor,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton(
                            child: const Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(FontAwesomeIcons.checkDouble,
                                      color: AppColors.primaryColor, size: 25),
                                ),
                                Text(
                                  "Mark all as read",
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        // PopupMenuItem(child: Divider()),
                        PopupMenuItem(
                          child: TextButton(
                            child: const Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Color(0xFFFF4436),
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  "Delete all Notification",
                                  style: TextStyle(color: Color(0xFFFF4436)),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        )
                      ]),
            ],
          )),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 20),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            height: double.maxFinite,
            child: Expanded(
                child: ListView.builder(
                    itemCount: userNotifications.length,
                    itemBuilder: (context, index) {
                      final notifier = userNotifications[index];
                      return Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Column(
                          children: [
                            ExpansionTile(
                              trailing: const SizedBox(),
                              leading: Container(
                                height: MediaQuery.sizeOf(context).width,
                                width: MediaQuery.sizeOf(context).width / 7,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(360)),
                                    image: DecorationImage(
                                        image: AssetImage(notifier.image))),
                              ),
                              title: Text(
                                notifier.title,
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 15),
                              ),
                              subtitle: Text(
                                '${notifier.date}',
                                style: TextStyle(color: AppColors.colorGrey),
                              ),
                              children: [
                                Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                            right: 170, bottom: 10),
                                        child: Text(
                                          "Scheduled for:",
                                          style: TextStyle(
                                              color: AppColors.colorGrey),
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              child: const Icon(
                                                FontAwesomeIcons.calendarDays,
                                                size: 15,
                                                color: AppColors.colorGrey,
                                              ),
                                            ),
                                            const Text(
                                              "Oct 12, 2023",
                                              style: TextStyle(
                                                  color: AppColors.colorGrey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: const Icon(
                                                size: 15,
                                                FontAwesomeIcons
                                                    .clockRotateLeft,
                                                color: AppColors.colorGrey,
                                              ),
                                            ),
                                            const Text(
                                              "8:00PM(WAT)",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.colorGrey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              width: 120,
                                              height: 35,
                                              decoration: const BoxDecoration(
                                                  color: AppColors.brandColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "Accept Invite",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .primaryColor),
                                                  ))),
                                          Container(
                                              width: 120,
                                              height: 35,
                                              decoration: const BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "Decline Invite",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .backgroundColor),
                                                  ))),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey[600],
                            )
                          ],
                        ),
                      );
                    })),
          ),
        ),
      ),
    );
  }
}

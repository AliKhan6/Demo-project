// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';

// import '../models/other_models/notifications.dart';

// class NotificationsService {
//   var _fcm = FirebaseMessaging.instance;

//   /// Initialize the [FlutterLocalNotificationsPlugin] package.
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

//   NotificationsService() {
//     initConfigure();
//   }

//   ///
//   ///Initializing Notifiication services that includes FLN, ANDROID NOTIFICATION CHANNEL setting
//   ///FCM NOTIFICATION SETTINGS, and also listeners for OnMessage and for onMessageOpenedApp
//   ///
//   initConfigure() async {
//     print('NotificationService::InitConfigure');
//     try {
//       print("@initFCMConfigure/started");
//       // await initFlutterLocalNotificationPlugin();
//       NotificationSettings settings = await _fcm.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       _moveToTheRespectiveScreen(Notifications notifications) {
//         // Get.to(() => NotificationScreen(
//         //     notificationType: notifications.notificationType));
//       }

//       _handleNotification(RemoteMessage message, bool isOnMessage) {
//         final Notifications notification =
//             Notifications.fromDirectJson(message.data);
//         print(notification.title);
//         print(notification.content);

//         if (isOnMessage) {
//           Get.snackbar(
//             notification.title!,
//             notification.content!,
//             backgroundColor: Colors.white,
//             duration: Duration(seconds: 4),
//             onTap: (data) {
//               _moveToTheRespectiveScreen(notification);
//             },
//           );
//         } else {
//           _moveToTheRespectiveScreen(notification);
//         }
//       }

//       ///
//       /// [onMessage] callback is called when the app is in foreground.
//       ///
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         final data = message.data;
//         debugPrint('Got a new notification in the foreground Mode');
//         debugPrint('@OnMessage==> Message: $message');
//         debugPrint('@OnMessage==> Data: ${message.data}');
//         debugPrint('@OnMessage==> Notification: ${message.notification}');
//         // RemoteNotification notification = message.notification!;
//         // AndroidNotification android = message.notification!.android!;
//         // hostUserId = message.data['hostUserId'].toString();
//         if (message.data != null) {
//           _handleNotification(message, true);
//         }
//         // if (!kIsWeb && notification != null && android != null) {
//         //   Get.dialog(
//         //     AlertDialog(
//         //       title: Text('Notification Recieved'),
//         //       content: Text('A new notification Recieved'),
//         //     ),
//         //   );
//         //   // flutterLocalNotificationsPlugin!.show(
//         //   //     notification.hashCode,
//         //   //     notification.title,
//         //   //     notification.body,
//         //   //     NotificationDetails(
//         //   //       iOS: IOSNotificationDetails(subtitle: channel.description),
//         //   //       android: AndroidNotificationDetails(
//         //   //         channel.id,
//         //   //         channel.name,
//         //   //         channel.description,
//         //   //         // TODO add a proper drawable resource to android, for now using
//         //   //         //      one that already exists in example app.
//         //   //         icon: '@mipmap/ic_launcher',
//         //   //       ),
//         //   //     ));
//         // }
//       });

//       ///
//       /// [onMessageOpenedApp] callback is called when notification is received
//       /// in the background (Both when app is running in the background as well
//       /// as terminated) and the notification is clicked from the notification tray.
//       ///
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         final data = message.data;
//         debugPrint('Got a new notification in the foreground now');
//         debugPrint('@onMessageOpenedApp==> Data: $data');
//         _handleNotification(message, false);
//         // RemoteNotification notification = message.notification!;
//         // AndroidNotification android = message.notification!.android!;
//         // print('A new onMessageOpenedApp event was published!');
//         // if (notification != null && android != null) {
//         //   flutterLocalNotificationsPlugin!.show(
//         //       notification.hashCode,
//         //       notification.title,
//         //       notification.body,
//         //       NotificationDetails(
//         //         iOS: IOSNotificationDetails(subtitle: channel.description),
//         //         android: AndroidNotificationDetails(
//         //           channel.id,
//         //           channel.name,
//         //           channel.description,
//         //           // TODO add a proper drawable resource to android, for now using
//         //           //      one that already exists in example app.
//         //           icon: '@mipmap/ic_launcher',
//         //         ),
//         //       ));
//         // }
//       });
//     } catch (e, s) {
//       print(e);
//       print(s);
//     }
//     print("@initConfigure/ENDED");
//   }

//   Future<String?> getFcmToken() async {
//     return await _fcm.getToken();
//   }
// }

import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/usecases/get_list_time_data_usecase.dart';
import 'package:timezone/data/latest_all.dart' as tzz;
import 'package:timezone/timezone.dart' as tz;

/// FlutterLocalNotificationsPlugin instance for the notifications.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Initializes the notifications.
Future<void> initializeNotifications() async {
  tzz.initializeTimeZones();
  //mi getlocation is chile

  tz.setLocalLocation(tz.getLocation('America/Santiago'));
  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> scheduleNotification(String name, String time24hFormat) async {
  final now = tz.TZDateTime.now(tz.local);
  final parts = time24hFormat.split(':');
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1]);

  final scheduledTime =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

  // Tiempos de notificación
  final notificationOffsets = <int>[30, 10, 5, 2, 1];

  const androidNotificationDetails = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
  );

  const notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  for (final offset in notificationOffsets) {
    final notificationTime = scheduledTime.subtract(Duration(minutes: offset));
    if (notificationTime.isBefore(now)) continue;

    await flutterLocalNotificationsPlugin.zonedSchedule(
      offset, // Usa el offset como ID de notificación para diferenciarlas
      'Recordatorio',
      'Faltan $offset minutos para tu tarea $name programada a las $time24hFormat',
      notificationTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}

/// Schedules notifications for a list of tasks.
Future<void> scheduleNotificationsForList() async {
  final data = await sl<GetListTimeData>().execute();

  data.fold((l) => log('Error data: $l'), (r) {
    for (final time in r) {
      log(time.toString());
      scheduleNotification(time.name ?? '', time.time ?? '00:00');
    }
  });
}

/// Starts a periodic check for notifications.
void startPeriodicNotificationCheck() {
  Stream<dynamic>.periodic(const Duration(minutes: 1)).listen((_) async {
    await scheduleNotificationsForList();
  });
}

import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taks_daily_app/app.dart';
import 'package:taks_daily_app/firebase_options.dart';
import 'package:taks_daily_app/notifications_local.dart';
import 'package:taks_daily_app/src/db/db_config.dart';
import 'package:taks_daily_app/src/injection.dart' as di;

late List<CameraDescription> cameras;
FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Configures the dependencies for the app.
  await di.configureDependencies();

  /// Initializes the database.
  final databaseHelper = DatabaseHelper();

  /// Initializes the database.
  await databaseHelper.database;

  /// Initializes the cameras.
  cameras = await availableCameras();

  /// Initializes the Firebase app.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Initializes the notifications.
  await initializeNotifications();

  /// Initializes the date formatting.
  await initializeDateFormatting('es_PE');

  /// Starts the periodic notification check.
  startPeriodicNotificationCheck();
  runApp(
    /// Wraps the app in the ProviderScope.
    const ProviderScope(
      child: App(),
    ),
  );
}

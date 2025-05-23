import 'package:bloc_expenses_tracker/app_view.dart';
import 'package:bloc_expenses_tracker/app_view_login.dart';
import 'package:bloc_expenses_tracker/notification_service.dart';
import 'package:bloc_expenses_tracker/screens/base/app_wrapper.dart';
import 'package:bloc_expenses_tracker/screens/login/login_bloc/login_bloc.dart';
import 'package:bloc_expenses_tracker/simple_bloc_observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await NotificationService.initialize();

  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  // Tắt Analytics cho FCM
  await FirebaseMessaging.instance.setAutoInitEnabled(false);

  //? Init noti service
  await NotificationService.initialize();

  // Đăng ký handler cho background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Kiểm tra user
  final user = FirebaseAuth.instance.currentUser;
  const String green = '\x1B[32m';
  const String reset = '\x1B[0m';
  print('$green user $user $reset');

  final bool isLoggedIn = user != null;

  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  print('FCM Token: $token');

  runApp(
    isLoggedIn
        ? const AppWrapper(
            child: MyAppView(),
          )
        : BlocProvider(
            create: (context) => LoginBloc(),
            child: const MyAppViewLogin(),
          ),
  );
}

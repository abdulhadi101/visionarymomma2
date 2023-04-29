import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/common.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';
import 'package:visionarymomma/features/auth/view/auth_otp.dart';

import 'package:visionarymomma/features/auth/view/welcome.dart';
import 'package:visionarymomma/features/home/view/home.dart';
import 'package:visionarymomma/features/onboarding/view/onboarding.dart';

void main() {
  runApp(
  const  ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ref.watch(currentUserAccountProvider).
          when(
        data: (user) {
      if (user?.emailVerification != null) {
    print(user?.emailVerification);
        return const AuthOTPPage();
      }
      return const WelcomePage();
    },
    error: (error, st) => ErrorPage(
    error: error.toString(),
    ),
    loading: () => const LoadingPage(),
    ),
    );
  }
}

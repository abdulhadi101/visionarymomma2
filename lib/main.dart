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
      child: MyApp(),

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
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        primarySwatch: Colors.blue,
      ),

      home: ref.watch(currentUserAccountProvider).
          when(
        data: (user) {
      if (user?.emailVerification == false) {
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

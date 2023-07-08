import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/models.dart';
import 'package:visionarymomma/core/utils.dart';
import 'package:visionarymomma/features/auth/view/auth_otp.dart';

import 'package:visionarymomma/features/home/view/home.dart';
import 'package:visionarymomma/features/registration/view/registration_page.dart';

import 'package:visionarymomma/models/user_model.dart';
import 'package:visionarymomma/repositories/auth_repository.dart';
import 'package:visionarymomma/repositories/user_repository.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
});

final currentUserDetailsProvider = FutureProvider((ref) {
  final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
  final userDetails = ref.watch(userDetailsProvider(currentUserId));
  print("object");
  print(userDetails);
  return userDetails.value;
//return userDetails.asData!.value;
});

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
  print("object");
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  AuthController(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(false);

  Future<User?> currentUser() => _authRepository.currentUserAccount();

  String errorMessage = "";

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authRepository.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold((l) {
      errorMessage = l.message;
      showSnackBar(context, l.message);
    }, (r) async {
      UserModel userModel = UserModel(
          email: email,
          firstname: "",
          lastname: "",
          phonenumber: "",
          country: "",
          state: "",
          city: "",
          maternalStatus: false,
          inviterCode: "",
          vmommaCode: "",
          connections: const [],
          connected: const [],
          numberOfKids: 0,
          interests: const [],
          profilePic: '',
          uid: r.$id,
          bioData: '',
          isMentor: false);
      final res2 = await _userRepository.saveUserData(userModel);
      res2.fold((l) => showSnackBar(context, l.message), (r) async {
        print(userModel);
        showSnackBar(context, 'Accounted created! Login In');
        login(email: email, password: password, context: context);

       await _authRepository.updatePrefs();

        //   Navigator.of(context).push(AuthOTPPage.route());

      });
    });
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authRepository.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        loginFlow(context);
      },
    );
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userRepository.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }

  void loginFlow(BuildContext context) async {
    final _user = await _authRepository.currentUserAccount();
    final _document = await _userRepository.getUserData(_user!.$id);
    final _userDoc = UserModel.fromMap(_document.data);

    if (!context.mounted) return;

    if (_user.emailVerification == false) {
      Navigator.push(
        context,
        AuthOTPPage.route(),
      );
    } else if (_userDoc.firstname == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(initialPage: 0),
        ),
      );
    } else if (_userDoc.country == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(initialPage: 1),
        ),
      );
    } else if (_userDoc.state == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(initialPage: 2),
        ),
      );
    } else if (_userDoc.city == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(initialPage: 3),
        ),
      );
    } else if (_userDoc.maternalStatus == Null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(initialPage: 4),
        ),
      );
    }
  }

  void logout(BuildContext context) async {
    final res = await _authRepository.logout();
    res.fold((l) => null, (r) {
      Navigator.pushAndRemoveUntil(
        context,
        HomePage.route(),
        (route) => false,
      );
    });
  }
}

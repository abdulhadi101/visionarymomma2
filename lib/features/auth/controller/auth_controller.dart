import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/models.dart';
import 'package:visionarymomma/core/utils.dart';
import 'package:visionarymomma/features/auth/view/auth_otp.dart';
import 'package:visionarymomma/features/auth/view/welcome.dart';
import 'package:visionarymomma/features/home/view/home.dart';
import 'package:visionarymomma/main.dart';
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

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
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

  String errorMessage ="";


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
          maternalStatus: "",
          inviterCode: "",
          vmommaCode: "",
          connections: const [],
          connected: const [],
          numberOfKids: 0,
          interests: const [],
          profilePic: '',
          uid: '',
          bioData: '',
          isSubscribed: false);
 final res2 = await _userRepository.saveUserData(userModel);
      res2.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Accounted created! Please login.');
        login(email: email, password: password, context: context);
         Navigator.of(context).push(AuthOTPPage.route());
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
      (r) {
        Navigator.push(context, HomePage.route());
      },
    );
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userRepository.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/core/utils.dart';


import 'package:visionarymomma/models/user_model.dart';
import 'package:visionarymomma/repositories/storage_repository.dart';
import 'package:visionarymomma/repositories/user_repository.dart';

final userProfileControllerProvider =
StateNotifierProvider<UserProfileController, bool>((ref) {
  return UserProfileController(

    storageRepository: ref.watch(storageRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),

  );
});

class UserProfileController extends StateNotifier<bool> {

  final StorageRepository _storageRepository;
  final UserRepository _userRepository;

  UserProfileController({

    required StorageRepository storageRepository,
    required UserRepository userRepository,

  })  :
        _storageRepository = storageRepository,
        _userRepository = userRepository,

        super(false);



  void updateUserProfile({
    required UserModel userModel,
    required BuildContext context,
   // required VoidCallback nextPage,

  }) async {
    state = true;

    final res = await _userRepository.updateUserData(userModel);
    state = false;
    res.fold(
          (l) => showSnackBar(context, l.message),
          (r) {
            showSnackBar(context, "updated successfully");

                      },


    );
  }


}
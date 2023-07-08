import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:visionarymomma/core/core.dart';
import 'package:visionarymomma/core/providers.dart';

final authRepositoryProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthRepository(account: account);
});

abstract class IAuthRepository {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
  FutureEither<Session> login({
    required String email,
    required String password,
  });
  Future<User?> currentUserAccount();
  FutureEitherVoid sendEmailCode();
  FutureEitherVoid logout();
}

class AuthRepository implements IAuthRepository {
  final Account _account;
  AuthRepository({required Account account}) : _account = account;

  @override
  Future<User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(

        userId: ID.unique(),
        email: email,
        password: password,

      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }


  @override
  FutureEitherVoid updatePrefs() async {
    try {
  await _account.updatePrefs(
        prefs: {
          'is_reg_done' : 'no',
          'is_inviter_id_skipped' : 'no',
          'is_biometric_skipped' : 'no',
          'is_terms_condition_accepted' : 'no',
          'is_interest_added' : 'no',
          'is_profile_picture_added' : 'no',
        },
      );

      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }


  @override
  void getPrefs() async {
    Future result = _account.getPrefs();

    result
        .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }

  @override
  FutureEither<Session> login({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEitherVoid logout() async {
    try {
      await _account.deleteSession(
        sessionId: 'current',
      );
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEitherVoid sendEmailCode() async{
    try {
      await _account.createVerification(
          url: "");
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
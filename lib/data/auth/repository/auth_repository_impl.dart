import 'package:dartz/dartz.dart';

import '/data/auth/models/user.dart';
import '/data/auth/models/user_creation_req.dart';
import '/data/auth/models/user_signin_req.dart';
import '/data/auth/source/auth_firebase_service.dart';
import '/domain/auth/repository/auth.dart';
import '/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignInReq user) async {
    return await sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(UserModel.fromMap(data).toEntity());
    });
  }
    @override
  Future<Either<Exception, void>> logout() async {
    return await sl<AuthFirebaseService>().logout();
  }
}

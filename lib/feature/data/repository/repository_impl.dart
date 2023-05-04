import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/data/datasource/auth_remote.dart';
import 'package:login_boiler_plate/feature/data/datasource/secure_storage.dart';
import 'package:login_boiler_plate/feature/domain/model/user.dart';
import 'package:login_boiler_plate/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/feature/domain/repository/user.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_signup.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_login.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final SecureStorage secureStorage;
  const UserRepositoryImpl(this.authRemoteDatasource, this.secureStorage);

  @override
  Future<Either<Failure, User>> login(LoginParams loginParams) async {
    return authRemoteDatasource.login(loginParams);
  }

  @override
  Future<Either<Failure, User>> signup(SignupParams signupParams) {
    return authRemoteDatasource.signup(signupParams);
  }

  @override
  Future<void> store(User user) {
    return secureStorage.storeToken(user);
  }

  @override
  Future<Either<Failure, User>> getInfo() async {
    String? token = await secureStorage.getToken();
    if (token == null) {
      return Left(
        NoDataFailure()
      );
    }
    return authRemoteDatasource.getInfo(token);
  }
}

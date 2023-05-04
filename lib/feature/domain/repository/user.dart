import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_signup.dart';

import '../../../core/core.dart';
import '../model/user.dart';
import '../usecase/post_login.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> login(LoginParams loginParams);

  Future<void> store(User user);

  Future<Either<Failure, User>> getInfo();

  Future<Either<Failure, User>> signup(SignupParams signupParams);
}

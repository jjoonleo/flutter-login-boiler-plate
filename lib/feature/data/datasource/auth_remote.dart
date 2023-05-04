import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain/model/user.dart';
import '../../domain/usecase/post_login.dart';
import '../../domain/usecase/post_signup.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, User>> signup(SignupParams registerParams);

  Future<Either<Failure, User>> login(LoginParams loginParams);

  Future<Either<Failure, User>> getInfo(String token);
}

import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/user/user.dart';


abstract class AuthRemoteDatasource {
  Future<Either<Failure, User>> signup(SignupParams registerParams);

  Future<Either<Failure, User>> login(LoginParams loginParams);

  Future<Either<Failure, User>> getInfo(String token);
}

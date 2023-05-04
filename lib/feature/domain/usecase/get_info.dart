import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/core/error/failure.dart';
import 'package:login_boiler_plate/core/usecase/usecase.dart';
import 'package:login_boiler_plate/feature/domain/model/user.dart';
import 'package:login_boiler_plate/feature/domain/repository/user.dart';

class GetInfoUseCase {
  final UserRepository _userRepository;

  GetInfoUseCase(this._userRepository);

  Future<Either<Failure, User>> execute() {
    return _userRepository.getInfo();
  }
}
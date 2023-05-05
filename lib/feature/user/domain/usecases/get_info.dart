import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/user/user.dart';


class GetInfoUseCase {
  final UserRepository _userRepository;

  GetInfoUseCase(this._userRepository);

  Future<Either<Failure, User>> execute() {
    return _userRepository.getInfo();
  }
}
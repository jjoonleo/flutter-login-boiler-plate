import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/domain/model/user.dart';
import 'package:login_boiler_plate/feature/domain/repository/user.dart';

class StoreUseCase extends UseCase<void, User>{
  final UserRepository _userRepository;

  StoreUseCase(this._userRepository);

  @override
  Future<void> execute(User params) {
    return _userRepository.store(params);
  }
}
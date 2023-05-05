import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/user/user.dart';

class StoreUseCase extends UseCase<void, User>{
  final UserRepository _userRepository;

  StoreUseCase(this._userRepository);

  @override
  Future<void> execute(User params) {
    return _userRepository.store(params);
  }
}


import 'package:login_boiler_plate/feature/user/user.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase(this._userRepository);

  Future<void> execute() {
    return _userRepository.logout();
  }
}
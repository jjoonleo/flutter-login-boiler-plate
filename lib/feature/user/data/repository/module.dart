import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_boiler_plate/feature/user/user.dart';


final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(authRemoteDatasourceProvider), ref.read(secureStorage));
});

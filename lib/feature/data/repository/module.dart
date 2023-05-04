import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/data/datasource/module.dart';
import 'package:login_boiler_plate/feature/data/repository/repository_impl.dart';
import 'package:login_boiler_plate/feature/domain/repository/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(authRemoteDatasourceProvider), ref.read(secureStorage));
});

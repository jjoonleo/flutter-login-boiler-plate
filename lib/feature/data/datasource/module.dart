import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/data/datasource/auth_remote_impl.dart';
import 'package:login_boiler_plate/feature/data/datasource/secure_storage.dart';
import 'package:login_boiler_plate/feature/data/datasource/secure_storage_impl.dart';

import 'auth_remote.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  // var user = ref.read(userState);
  // String? token;
  // user.mapOrNull(
  //   data: (data) {
  //     token = data.user.token;
  //   },
  // );
  return AuthRemoteDatasourceImpl(DioClient());
});

final secureStorage = Provider<SecureStorage>((ref) {
  return SecureStorageImpl();
});

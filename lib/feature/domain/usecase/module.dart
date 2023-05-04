import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_boiler_plate/feature/data/repository/module.dart';
import 'package:login_boiler_plate/feature/domain/usecase/get_info.dart';
import 'package:login_boiler_plate/feature/domain/usecase/logout.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_login.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_signup.dart';
import 'package:login_boiler_plate/feature/domain/usecase/store.dart';

final postLoginProvider = Provider<PostLoginUseCase>((ref) {
  return PostLoginUseCase(ref.read(userRepositoryProvider));
});

final postSignupProvider = Provider<PostSignupUseCase>((ref) {
  return PostSignupUseCase(ref.read(userRepositoryProvider));
});


final storeProvider = Provider<StoreUseCase>((ref) {
  return StoreUseCase(ref.read(userRepositoryProvider));
});

final getInfoProvider = Provider<GetInfoUseCase>((ref) {
  return GetInfoUseCase(ref.read(userRepositoryProvider));
});

final logoutProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(userRepositoryProvider));
});

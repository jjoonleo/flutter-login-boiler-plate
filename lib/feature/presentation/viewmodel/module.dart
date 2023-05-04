import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_login.dart';
import 'package:login_boiler_plate/feature/domain/usecase/post_signup.dart';

import '../../../core/core.dart';
import '../../domain/usecase/module.dart';
import '../state/user.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier(this.ref) : super(const UserState.notLoggedIn()) {
    getUserInfo();
  }

  final Ref ref;
  late final postLoginUseCase = ref.read(postLoginProvider);
  late final logoutUseCase = ref.read(logoutProvider);
  late final postSignupUseCase = ref.read(postSignupProvider);
  late final storeUseCase = ref.read(storeProvider);
  late final getInfoUseCase = ref.read(getInfoProvider);

  Future<void> getUserInfo() async {
    state = UserState.notLoggedIn();

    final user = await getInfoUseCase.execute();
    user.fold((l) {
      if (l is ServerFailure) {
        state = UserState.error(message: l.message ?? "");
      } else if (l is NoDataFailure) {
        state = UserState.notLoggedIn();
      }
    }, (r) {
      state = UserState.loggedIn(r);
      debugPrint("getUserInfo success");
    });
  }

  Future<void> login(LoginParams loginParams) async {
    state = const UserState.notLoggedIn();

    final user = await postLoginUseCase.execute(loginParams);
    user.fold((l) {
      if (l is ServerFailure) {
        state = UserState.error(message: l.message ?? "");
      }
    }, (r) {
      state = UserState.loggedIn(r);
      debugPrint("Succes");
    });
  }

  Future<void> logout() async {
    state = const UserState.notLoggedIn();

    logoutUseCase.execute();
  }

  Future<void> signup(SignupParams signupParams) async {
    state = const UserState.notLoggedIn();

    final user = await postSignupUseCase.execute(signupParams);

    user.fold((l) {
      if (l is ServerFailure) {
        state = UserState.error(message: l.message ?? "");
      }
    }, (r) {
      state = UserState.loggedIn(r);
      debugPrint("Succes");
    });
  }

  Future<void> store() async {
    await state.whenOrNull(loggedIn: (data) async {
      await storeUseCase.execute(data);
    });
  }
}

final userState = StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  return UserStateNotifier(ref);
});

final userModel = Provider<UserStateNotifier>((ref) {
  return ref.watch(userState.notifier);
});

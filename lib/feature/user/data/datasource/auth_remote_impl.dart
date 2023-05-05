import 'package:dartz/dartz.dart';
import 'package:login_boiler_plate/core/core.dart';
import 'package:login_boiler_plate/feature/user/user.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, User>> signup(SignupParams signupParams) async {
    final response = await _client.postRequest(
      APIList.signup,
      data: signupParams.toJson(),
      converter: (response) => User.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, User>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      APIList.login,
      data: loginParams.toJson(),
      converter: (response) => User.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, User>> getInfo(String token) async {
    final response = await _client.postRequest(
      APIList.getInfo,
      auth: token,
      converter: (response) {
        response["token"] = token;
        return User.fromJson(response as Map<String, dynamic>);
      },
    );
    return response;
  }
}

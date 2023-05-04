import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_boiler_plate/feature/data/datasource/secure_storage.dart';
import 'package:login_boiler_plate/feature/domain/model/user.dart';

class SecureStorageImpl implements SecureStorage {
  final storage = FlutterSecureStorage();

  SecureStorageImpl();

  @override
  Future<void> storeToken(User user) async {
    await storage.write(key: "token", value: user.token);
  }

  @override
  Future<String?> getToken() async {
    return storage.read(key: "token");
  }

  @override
  Future<void> deleteToken() async {
    await storage.delete(key: "token");
  }
}

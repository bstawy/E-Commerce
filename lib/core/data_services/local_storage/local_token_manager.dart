import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class LocalTokenManager {
  final _storage = const FlutterSecureStorage();
  String? _token;

  @factoryMethod
  Future<void> setToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  @factoryMethod
  Future<String?> getToken() async {
    _token = await _storage.read(key: 'token');
    return _token;
  }

  @factoryMethod
  Future<void> removeToken() async {
    await _storage.delete(key: 'token');
  }
}

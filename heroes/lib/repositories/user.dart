import 'package:heroes/api/heroes_api.dart';
import 'package:heroes/storages/storage_token.dart';

class UserRepository {
  final HeroesApiClient api = HeroesApiClient();
  final TokenStorage storageToken = TokenStorage();

  Future<String> login(
      String login,
      String password,
    ) async {
    return await this.api.login(login, password);
  }

  Future<void> logout() async {
    await this.api.logout();
  }

  Future<bool> hasToken() async {
    String token = await storageToken.getValue();
    return token != null && token.length > 0;
  }
}
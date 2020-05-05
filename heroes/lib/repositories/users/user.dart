import 'package:heroes/init_locator.dart';
import 'package:heroes/repositories/base.dart';
import 'package:heroes/repositories/users/interface.dart';
import 'package:heroes/storages/storage_token.dart';

class UserRepository extends BaseRepository implements IUserRepository {
  @override
  Future<bool> login(
      String login,
      String password,
    ) async {
    String token = await this.api.login(login, password);
    return token != null && token.length > 0;
  }

  @override
  Future<void> logout() async {
    await this.api.logout();
  }

  @override
  Future<bool> hasToken() async {
    String token = await locator.get<TokenStorage>().getValue();
    return token != null && token.length > 0;
  }
}
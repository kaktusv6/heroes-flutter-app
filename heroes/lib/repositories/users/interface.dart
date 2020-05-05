import 'package:heroes/repositories/base.dart';

abstract class IUserRepository extends BaseRepository {
  Future<bool> login(String login, String password);

  Future<void> logout();

  Future<bool> hasToken();
}
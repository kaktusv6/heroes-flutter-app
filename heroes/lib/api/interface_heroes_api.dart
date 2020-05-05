abstract class IHeroesApiClient {
  Future<String> register(String login, String password);

  Future<String> login(String login, String password);

  Future<bool> logout();

  Future<Map<String, String>> authHeader();

  String generatePathApi(String path);
}
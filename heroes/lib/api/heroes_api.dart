import 'dart:io';

import 'package:heroes/api/base_api.dart';
import 'package:heroes/storages/api_key.dart';
import 'package:heroes/storages/storage_token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HeroesApiClient extends BaseApiClient {
  final TokenStorage _tokenStorage = TokenStorage();
  final ApiKeyStorage _apiKeyStorage = ApiKeyStorage();

  HeroesApiClient()
      : super(
          url: DotEnv().env['URL_API'],
          client: new http.Client(),
        );

  Future<String> register(String login, String password) async {
    var response = await this.post('user/register', body: {
      'login': login,
      'password': password,
    });
    _tokenStorage.setValue(response['token']);
    return response['token'];
  }

  Future<String> login(String login, String password) async {
    var response = await this.post(
      'user/login',
      body: {
        'login': login,
        'password': password,
      },
    );
    _tokenStorage.setValue(response['token']);
    return response['token'];
  }

  Future<bool> logout() async {
    var response = await this.post(
      'user/logout',
      body: {
        'token': await this._tokenStorage.getValue(),
      },
      header: await this.authHeader(),
    );
    if (response['is_logout']) {
      _tokenStorage.delete();
    }

    return response['is_logout'];
  }

  Future<Map<String, String>> authHeader() async {
    return {
      HttpHeaders.authorizationHeader:
          'Bearer ' + await this._tokenStorage.getValue(),
    };
  }

  @override
  Future<Uri> generateUri(String path, {Map<String, String> query}) async {
    return super.generateUri(this.generatePathApi(path),
        query: {'api_key': await this._apiKeyStorage.getValue()});
  }

  String generatePathApi(String path) {
    return '/api/' + path;
  }
}

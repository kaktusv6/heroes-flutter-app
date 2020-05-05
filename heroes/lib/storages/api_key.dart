import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroes/storages/base_storage.dart';

class ApiKeyStorage extends BaseStorage {
  ApiKeyStorage(): super(key: 'api_key', defaultValue: DotEnv().env['API_KEY']);
}
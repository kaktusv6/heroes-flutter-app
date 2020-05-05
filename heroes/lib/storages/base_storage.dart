import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../init_locator.dart';

abstract class BaseStorage {
  final FlutterSecureStorage storage = locator.get<FlutterSecureStorage>();
  final String key;
  final String defaultValue;

  BaseStorage({
    @required this.key,
    this.defaultValue
  }) {
    if (this.defaultValue != null) {
      storage.write(key: key, value: defaultValue);
    }
  }

  Future<String> getValue() async {
    return await this.storage.read(key: this.key);
  }

  setValue(value) async {
    await this.storage.write(key: this.key, value: value);
  }

  delete() async {
    await this.storage.delete(key: key);
  }
}
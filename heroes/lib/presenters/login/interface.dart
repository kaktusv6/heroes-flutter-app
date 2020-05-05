import 'package:flutter/src/services/text_input.dart';

abstract class ILoginPresenter {
  Future<bool> checkLogin();

  Future<bool> login(String login, String password);
}

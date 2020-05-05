import 'package:heroes/presenters/login/interface.dart';
import 'package:heroes/repositories/users/interface.dart';
import 'package:meta/meta.dart';

class LoginPresenter implements ILoginPresenter {
  final IUserRepository userRepository;

  LoginPresenter({@required this.userRepository});

  @override
  Future<bool> checkLogin() async {
    return await userRepository.hasToken();
  }

  @override
  Future<bool> login(String login, String password) async {
    return await userRepository.login(login, password);
  }
}
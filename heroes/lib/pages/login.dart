import 'package:flutter/material.dart';
import 'package:heroes/repositories/user.dart';
import 'package:heroes/widgets/login_form.dart';

class Login extends StatelessWidget {
  final UserRepository userRepository;

  Login({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(),
    );
  }
}

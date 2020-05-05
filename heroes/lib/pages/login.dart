import 'package:flutter/material.dart';
import 'package:heroes/presenters/login/interface.dart';
import 'package:heroes/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final ILoginPresenter presenter;

  LoginPage({Key key, @required this.presenter})
      : assert(presenter != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginForm(presenter: presenter),
    );
  }
}

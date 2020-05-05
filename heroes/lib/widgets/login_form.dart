import 'package:flutter/material.dart';
import 'package:heroes/presenters/login/interface.dart';
import 'package:load/load.dart';

class LoginForm extends StatefulWidget {
  final ILoginPresenter presenter;

  const LoginForm({Key key, @required this.presenter}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.widget.presenter.checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.pushReplacementNamed(context, '/games');
      }
    });

    _onLoginPasswordPressed() {
      this
        .widget
        .presenter
        .login(_usernameController.text, _passwordController.text)
        .then(
          (isSuccess) {
            if (isSuccess) {
              Navigator.pushReplacementNamed(context, '/games');
            }
          }
        );
    }

    _onNavigateToRegistrationPage() {}

    return Center(
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              controller: _usernameController,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              controller: _passwordController,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: _onLoginPasswordPressed,
              child: Text('Login'),
            ),
            RaisedButton(
              onPressed: _onNavigateToRegistrationPage,
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}

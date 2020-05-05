import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginPasswordPressed() {

    }

    _onGoToRegistrationPage() {

    }

    return Form(
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
            onPressed: _onGoToRegistrationPage,
            child: Text('Registration'),
          ),
          Container(
            child: null,
          ),
        ],
      ),
    );
  }
}

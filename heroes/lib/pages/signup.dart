import 'package:flutter/material.dart';
import 'package:heroes/repositories/users/user.dart';

class SignupPage extends StatelessWidget {
  final UserRepository userRepository;

  SignupPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
        ),
        body: Text('Registration'),
      );
}

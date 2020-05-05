import 'package:flutter/material.dart';
import 'package:heroes/repositories/user.dart';

class Splash extends StatelessWidget {
  final UserRepository userRepository = new UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
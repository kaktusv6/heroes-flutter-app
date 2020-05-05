import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroes/pages/splash.dart';
import 'package:heroes/repositories/user.dart';

import 'init_locator.dart';

void main() async {
  await DotEnv().load('.env');
  setupLocator();
  final userRepository = UserRepository();

  runApp(
    App(
      userRepository: userRepository
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
      },

    );
  }
}

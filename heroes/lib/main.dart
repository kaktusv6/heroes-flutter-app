import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroes/repositories/user.dart';
import 'package:heroes/presenters/login/login.dart';
import 'package:heroes/repositories/users/interface.dart';
import 'package:heroes/repositories/users/user.dart';

import 'init_locator.dart';

void main() async {
  await DotEnv().load('.env');
  setupLocator();
  final IUserRepository userRepository = UserRepository();

  runApp(
    LoadingProvider(
        child: App(
            userRepository: userRepository,
        )
    ),
  );
}

class App extends StatelessWidget {
  final IUserRepository userRepository;

  App({
    Key key,
    @required this.userRepository,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splash(),
      },

    );
  }
}

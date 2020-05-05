import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:heroes/presenters/login/login.dart';
import 'package:heroes/repositories/games/games.dart';
import 'package:heroes/repositories/games/interface.dart';
import 'package:heroes/repositories/users/interface.dart';
import 'package:heroes/repositories/users/user.dart';

import 'init_locator.dart';

void main() async {
  await DotEnv().load('.env');
  setupLocator();
  final IUserRepository userRepository = UserRepository();
  final IGameRepository gameRepository = GameRepository();

  runApp(
    LoadingProvider(
        child: App(
            userRepository: userRepository,
            gameRepository: gameRepository,
        )
    ),
  );
}

class App extends StatelessWidget {
  final IUserRepository userRepository;
  final IGameRepository gameRepository;

  App({
    Key key,
    @required this.userRepository,
    @required this.gameRepository
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        name: 'assets/intro.flr',
        next: (_) => LoginPage(
          presenter: LoginPresenter(userRepository: userRepository),
        ),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: '1',
      ),
      routes: {
      },
    );
  }
}

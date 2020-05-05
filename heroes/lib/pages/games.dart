import 'package:flutter/material.dart';
import 'package:heroes/presenters/games/interface.dart';

class GamesPage extends StatelessWidget {
  final IGamesPresenter presenter;

  const GamesPage({Key key, @required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Games'),
            onPressed: () {

            },
          ),
        ),
      ),
    );
  }
}
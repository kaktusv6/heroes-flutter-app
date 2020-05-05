import 'package:heroes/presenters/games/interface.dart';
import 'package:heroes/repositories/games/interface.dart';
import 'package:meta/meta.dart';

class GamesPresenter implements IGamesPresenter {
  final IGameRepository gameRepository;

  GamesPresenter({@required this.gameRepository});

  @override
  getGames() {

  }
}
import 'package:heroes/models/game.dart';
import 'package:heroes/repositories/base.dart';
import 'package:heroes/repositories/games/interface.dart';

class GameRepository extends BaseRepository implements IGameRepository {
  @override
  Future<List<Game>> allGames() {

  }
}
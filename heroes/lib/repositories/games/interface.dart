
import 'package:heroes/models/game.dart';

abstract class IGameRepository {
  Future<List<Game>> allGames() {

  }
}
import 'package:heroes/api/heroes_api.dart';
import 'package:heroes/api/interface_heroes_api.dart';
import 'package:heroes/init_locator.dart';

abstract class BaseRepository {
  final IHeroesApiClient api = locator.get<HeroesApiClient>();
}
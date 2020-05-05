import 'package:flutter/cupertino.dart';
import 'package:heroes/models/base_model.dart';

class Game extends Model {
  final int id;
  final String name;
  final String description;

  Game({@required this.id, @required this.name, this.description});

  @override
  List<Object> get props => [
    id,
    name,
  ];
}
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class AgileFly extends Fly {
  double get speed => game.tileSize * 5;

  AgileFly(MainGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/agile-fly-1.png'));
    flyingSprites.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}

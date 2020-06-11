import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class HungryFly extends Fly {
  HungryFly(MainGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprites.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');
  }
}

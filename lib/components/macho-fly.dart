import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class MachoFly extends Fly {
  double get speed => game.tileSize * 2.5;

  MachoFly(MainGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/macho-fly-1.png'));
    flyingSprites.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}

import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutterGame/main-game.dart';

class Backyard {
  final MainGame game;
  Sprite bgSprite;
  Rect bgRect;

  //bg1080 * 2760
  Backyard(this.game) {
    bgSprite = Sprite('bg/backyard.png');
    bgRect = Rect.fromLTWH(0, game.screenSize.height - (game.tileSize * 23),
        game.tileSize * 9, game.tileSize * 23);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}

import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterGame/main-game.dart';

class LostView {
  final MainGame game;
  Rect titleRect;
  Sprite titleSprite;

  LostView(this.game) {
    titleRect = Rect.fromLTWH(
        game.tileSize,
        game.screenSize.height / 2 - game.tileSize * 4,
        game.tileSize * 7,
        game.tileSize * 4);

    titleSprite = Sprite('bg/lose-splash.png');
  }

  void render(Canvas c) {
    titleSprite.renderRect(c, titleRect);
  }

  void update(double t) {}
}

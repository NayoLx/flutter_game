import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterGame/main-game.dart';

class StartButton {
  final MainGame game;
  Rect rect;
  Sprite sprite;

  StartButton(this.game) {
    rect = Rect.fromLTWH(
        game.tileSize * 1.5,
        (game.screenSize.height / .75) - (game.tileSize * 1.5),
        game.tileSize * 6,
        game.tileSize * 3);

    sprite = Sprite('ui/start-button.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void update(double t) {}

  void onTapDown() {}
}

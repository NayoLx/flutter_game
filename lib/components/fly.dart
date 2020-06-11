import 'dart:ui';
import 'package:flutterGame/main-game.dart';
import 'package:flame/sprite.dart';

class Fly {
  final MainGame game;
  Rect flyRect; //实例变量
  List flyingSprites; //Sprite变量不会在这里初始化，每个子类都会使用不用的Sprite
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  bool isDead = false;
  bool isOffScene = false;

  //构造函数--实例、初始坐标X, 初始坐标Y.
  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprites[flyingSpriteIndex.toInt()]
          .renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    } else {
      flyingSpriteIndex += 30 *t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -=2;
      }
    }
    if (flyRect.top > game.screenSize.height) {
      isOffScene = true;
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }
}

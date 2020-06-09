import 'dart:ui';
import 'package:flutterGame/main-game.dart';

class Fly {
  final MainGame game;
  Rect flyRect; //实例变量
  Paint flyPaint;

  bool isDead = false;
  bool isOffScene = false;

  //构造函数--实例、初始坐标X, 初始坐标Y.
  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }
    if (flyRect.top > game.screenSize.height) {
      isOffScene = true;
    }
  }

  void onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
    game.spawnFly();
  }
}

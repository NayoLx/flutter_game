import 'dart:ui';
import 'package:flutterGame/main-game.dart';
import 'package:flame/sprite.dart';

class Fly {
  final MainGame game;
  Rect flyRect; //实例变量
  List flyingSprites; //Sprite变量不会在这里初始化，每个子类都会使用不用的Sprite
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  double get speed => game.tileSize * 3; //速度
  Offset target; //计算方向，距离，缩放等

  bool isDead = false;
  bool isOffScene = false;

  //构造函数--实例、【初始坐标X, 初始坐标Y.】
  Fly(this.game) {
    setTarget();
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprites[flyingSpriteIndex.toInt()]
          .renderRect(c, flyRect.inflate(2));
    }
  }

  //t 时间增量 自身update运行以来的时间
  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    } else {
      //飞行动画 帧数
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }

      //移动
      //stepDistance 存储改移动的距离 stepTarget计算当前位置到目标位置的偏移量
      double stepDistance = speed * t;
      Offset toTarget = target - Offset(flyRect.left, flyRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTarget();
      }
    }
    if (flyRect.top > game.screenSize.height) {
      isOffScene = true;
    }
  }

  //设置计算方向，距离，缩放等
  void setTarget() {
    double x = game.random.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.random.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    target = Offset(x, y);
  }

  void onTapDown() {
    isDead = true;
  }
}

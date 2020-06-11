import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class HouseFly extends Fly {
  //todo 在构造函数中调用super，告诉程序在运行构造函数内的代码先运行父类的构造函数，构造函数直击镜像了超类构造函数所需的参数，并在调用super时将其转发
  //todo 没有重写render和update函数，因为这个没有特殊属性
  HouseFly(MainGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.5, game.tileSize * 1.5);
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/house-fly-1.png'));
    flyingSprites.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');
  }
}

import 'dart:ui';
import 'dart:math';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutterGame/components/start.dart';
import 'package:flutterGame/view.dart';
import 'package:flutterGame/views/home-view.dart';

import 'package:flutterGame/components/agile-fly.dart';
import 'package:flutterGame/components/backyard.dart';
import 'package:flutterGame/components/drooler-fly.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/components/house-fly.dart';
import 'package:flutterGame/components/hungry-fly.dart';
import 'package:flutterGame/components/macho-fly.dart';

//todo 导入类，创建类的实例，存储实例变化/初始化实例，渲染该类
class MainGame extends Game {
  Size screenSize; //存储屏幕尺寸
  double tileSize; //宽度比--对象宽度
  List<Fly> flies; //对象数组
  Random random; //随机数
  Backyard background;
  View activeView = View.home;
  HomeView homeView;
  StartButton startButton; //开始按钮

  MainGame() {
    init();
  }

  //初始化
  void init() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions()); //等待size后进行初始化
    background = Backyard(this);
    homeView = HomeView(this);
    startButton = StartButton(this);

    random = Random();
    spawnFly();
  }

  //渲染
  void render(Canvas canvas) {
    background.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
    flies.forEach((fly) => fly.render(canvas));
  }

  //刷新-更新
  void update(double t) {
    flies.forEach((fly) => fly.update(t));
    flies.removeWhere((fly) => fly.isOffScene);
  }

  //屏幕尺寸变更--自适应？
  void resize(Size size) async {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  //生成对象的函数【random随机生成】
  void spawnFly() {
    double x = random.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = random.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (random.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  //点击事件
  void onTapDown(TapDownDetails d) {
    List<Fly>.from(flies).forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }

//  flies.forEach((Fly fly) {
//    if (fly.flyRect.contains(d.globalPosition)) {
//      fly.onTapDown();
//    }
//  });
// 用这个会报这个错误
// The following ConcurrentModificationError was thrown while handling a gesture:
//Concurrent modification during iteration: Instance(length:2) of '_GrowableList'.

}

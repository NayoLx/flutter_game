import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/util.dart';

import 'main-game.dart';

void main() async {
  //防止报错
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();//全屏
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);//锁定屏幕为横屏

  //实例化
  MainGame game = MainGame();

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);

  //运行
  runApp(game.widget);
}

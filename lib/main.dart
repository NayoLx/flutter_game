import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/util.dart';

import 'package:flame/flame.dart';
import 'main-game.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //防止报错
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen(); //全屏
  await flameUtil.setOrientation(DeviceOrientation.portraitUp); //锁定屏幕为横屏

  Flame.images.loadAll([
    'bg/backyard.png',
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/house-fly-1.png',
    'flies/house-fly-2.png',
    'flies/house-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
    'bg/lose-splash.png',
    'branding/title.png',
    'ui/dialog-credits.png',
    'ui/dialog-help.png',
    'ui/icon-credits.png',
    'ui/icon-help.png',
    'ui/start-button.png',
  ]);

  //实例化 -- 实例缓存
  SharedPreferences storage = await SharedPreferences.getInstance();
  MainGame game = MainGame(storage);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);

  //运行
  runApp(game.widget);
}

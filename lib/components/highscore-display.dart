import 'package:flutter/cupertino.dart';
import 'package:flutterGame/main-game.dart';

//todo 不含update，分数将会手动更新
class HighScoreDisplay {
  final MainGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  //实例变量必须在创建此类实例时被初始化
  HighScoreDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    Shadow shadow = Shadow(
      blurRadius: 3,
      color: Color(0xff000000),
      offset: Offset.zero,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 30,
      shadows: [shadow, shadow, shadow, shadow],
    );

    position = Offset.zero;

    updateHighScore();
  }

  void updateHighScore() {
    int highScore = game.storage.getInt('highScore') ?? 0;

    painter.text = TextSpan(
      text: 'High-Score: ' + highScore.toString(),
      style: textStyle,
    );

    painter.layout();

    position = Offset(
      game.screenSize.width - (game.tileSize * .25) - painter.width,
      game.tileSize * .25,
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }
}

import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class AgileFly extends Fly {
  AgileFly(MainGame game, double x, double y) : super(game, x, y) {
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/agile-fly-1.png'));
    flyingSprites.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }
}
import 'package:flame/sprite.dart';
import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class MachoFly extends Fly {
  MachoFly(MainGame game, double x, double y) : super(game, x, y) {
    flyingSprites = List();
    flyingSprites.add(Sprite('flies/macho-fly-1.png'));
    flyingSprites.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');
  }
}

import 'package:flutterGame/components/fly.dart';
import 'package:flutterGame/main-game.dart';

class FlySpawner {
  final MainGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxFilesOnScreen = 7;

  int currentInterval;
  int nextSpawn;

  FlySpawner(this.game) {
    start();
    game.spawnFly();
  }

  //开始
  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.flies.forEach((Fly fly) {
      fly.isDead = true;
    });
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
    int livingFlies = 0;
    game.flies.forEach((Fly fly) {
      if (!fly.isDead) {
        livingFlies += 1;
      }
    });

    if (nowTimestamp >= nextSpawn && livingFlies < maxFilesOnScreen) {
      game.spawnFly();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * 0.02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}

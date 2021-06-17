import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

main() {
  final myGame = MyGame();
  runApp(
    GameWidget(
      game: myGame,
    ),
  );
}

class MyGame extends BaseGame {
  MyGame();

  final _layersMeta = {
    'ocean_1.png': .1,
    'ocean_2.png': 0.00001,
  };
  @override
  Future<void> onLoad() async {
    final layers = _layersMeta.entries.map(
      (e) => loadParallaxLayer(
        e.key,
        velocityMultiplier: Vector2(e.value, 1.0),
      ),
    );
    final parallax = ParallaxComponent.fromParallax(
      Parallax(
        await Future.wait(layers),
        baseVelocity: Vector2(20, 0),
      ),
    );
    add(parallax);
  }
}

class YellowCube extends SpriteComponent {
  YellowCube(position);

  @override
  Future<void> onLoad() async {
    final sprite = await Sprite.load('cube.png');
    final size = Vector2.all(128.0);
    this.sprite = sprite;
    this.size = size;
  }
}

import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black38,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${game.bird.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontFamily: 'Game',
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(Assets.gameOver),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}

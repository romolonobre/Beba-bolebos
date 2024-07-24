import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friends_game/challenge.dart';
import 'package:friends_game/widgtes/custom_elevated_button.dart';
import 'package:lottie/lottie.dart';

import 'widgtes/custom_text_button.dart';

class GameScreen extends StatefulWidget {
  final List<String> names;

  const GameScreen(this.names, {super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<Challenge> _completedChallenges = [];
  late List<Challenge> initialChallenges;
  bool gameStarted = false;
  String _result = "";
  int _key = 0;

  @override
  void initState() {
    super.initState();
    initialChallenges = List.from(challenges);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1a26),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            // Lottie animation
            LottieBuilder.asset(
              "assets/drink_3.json",
              height: 300,
            ),

            // Challenge animated text
            SizedBox(
              height: 150,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 201),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: RichText(
                  key: ValueKey<int>(_key),
                  text: TextSpan(
                    style: const TextStyle(fontSize: 24),
                    children: richText(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            //
            // PLAY button
            CustomElevatedButton(
              text: 'PLAY',
              onPressed: _play,
            ),

            const SizedBox(height: 20),

            //
            // NEW GAME button
            CustomTextButton(
              text: 'NEW GAME',
              onPressed: () => setState(() {
                _restartGame();
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

// Restart the game
  void _restartGame() {
    setState(() {
      _result = "";
      _completedChallenges.clear();
      challenges = List.from(initialChallenges);
    });
  }

  // PLAY
  void _play() {
    gameStarted = true;
    final random = Random();

    if (challenges.isEmpty) {
      setState(() {
        _result = "THIS ROUND IS OVER, FINISH YOUR DRINKS!!";
      });
      return;
    }

    // Generate random index
    int getRandomIndex(List list) => random.nextInt(list.length);
    final challengeIndex = getRandomIndex(challenges);
    final nameIndex = getRandomIndex(widget.names);
    final secondNameIndex = getRandomIndex(widget.names);

    // Get selected challenge and names
    final challenge = challenges[challengeIndex];
    final name = widget.names[nameIndex];
    final secondName = widget.names[secondNameIndex];

    // Determine the result based on the challenge
    String result;
    if (challenge.multiplo) {
      result = "$name ${challenge.value} $secondName ${challenge.valueB}";
    } else if (challenge.all) {
      result = challenge.value;
    } else {
      result = "$name ${challenge.value}";
    }

    // Update state with the result and remove the used challenge
    setState(() {
      _result = result;
      _completedChallenges.add(challenge);
      challenges.removeAt(challengeIndex);
      _key++;
    });
  }

// Set the text color for player names to red and challenges to white
  List<TextSpan> richText() {
    if (!gameStarted) {
      return [
        const TextSpan(
          text: "Press play to start the game",
          style: TextStyle(color: Colors.white),
        ),
      ];
    }

    final words = _result.split(' ');
    final List<TextSpan> spans = [];
    const nameColor = Colors.red;

    for (final word in words) {
      if (widget.names.contains(word)) {
        spans.add(TextSpan(text: '$word ', style: const TextStyle(color: nameColor)));
      } else {
        spans.add(TextSpan(text: '$word ', style: const TextStyle(color: Colors.white)));
      }
    }

    return spans;
  }
}

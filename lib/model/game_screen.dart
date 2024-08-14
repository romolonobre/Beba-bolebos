import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friends_game/model/challenge.dart';
import 'package:friends_game/widgtes/custom_elevated_button.dart';
import 'package:localization/localization.dart';
import 'package:lottie/lottie.dart';

import '../widgtes/custom_text_button.dart';

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
              text: "play".i18n(),
              onPressed: _play,
            ),

            const SizedBox(height: 20),

            //
            // NEW GAME button
            CustomTextButton(
              text: "new-game".i18n(),
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
        _result = "finish-drinks".i18n();
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
        TextSpan(
          text: "press-play".i18n(),
          style: const TextStyle(color: Colors.white),
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

  List<Challenge> challenges = [
    Challenge(
      value: "drink-3-gulps".i18n(),
    ),
    Challenge(
      value: "make-one-for-us".i18n(),
    ),
    Challenge(
      value: "drink-whenever-you-want".i18n(),
    ),
    Challenge(
      value: "lucky-2-gulp-pass".i18n(),
    ),
    Challenge(
      value: "biggest-star-solar-system".i18n(),
    ),
    Challenge(
      value: "drink-one-shot-stop-being-silly".i18n(),
    ),
    Challenge(
      value: "born-in-rio-de-janeiro".i18n(),
    ),
    Challenge(
      value: "are-you-okay".i18n(),
    ),
    Challenge(
      value: "drink-1-shot-lemon-salt".i18n(),
    ),
    Challenge(
      value: "make-a-choice".i18n(),
    ),
    Challenge(
      value: "you-and-friends-drink-3-gulps".i18n(),
    ),
    Challenge(
      value: "challenge-someone-flip-cup".i18n(),
    ),
    Challenge(
      value: "tell-something-nobody-knows".i18n(),
    ),
    Challenge(
      value: "if-your-cup-is-full-flip-it".i18n(),
    ),
    Challenge(
      value: "choose-funniest-person-drink-shot".i18n(),
    ),
    Challenge(
      value: "choose-player-sit-out-5-minutes".i18n(),
    ),
    Challenge(
      value: "make-funny-gesture".i18n(),
    ),
    Challenge(
      value: "dance-on-the-mouth-of-the-bottle".i18n(),
    ),
    Challenge(
      value: "choose-next-3-songs".i18n(),
    ),
    Challenge(
      value: "drink-glass-of-water".i18n(),
    ),
    Challenge(
      value: "choose-nickname-for-left-player".i18n(),
    ),
    Challenge(
      value: "what-is-it-clear-and-salty".i18n(),
    ),
    Challenge(
      value: "say-a-flaw".i18n(),
    ),
    Challenge(
      value: "fill-your-cup-with-water".i18n(),
    ),
    Challenge(
      value: "drink-2-gulps-upside-down".i18n(),
    ),
    Challenge(
      value: "take-10-minute-break".i18n(),
    ),
    Challenge(
      value: "cant-leave-table-20-minutes".i18n(),
    ),
    Challenge(
      value: "choose-someone-to-kiss".i18n(),
    ),
    Challenge(
      value: "try-to-make-someone-laugh".i18n(),
    ),
    Challenge(
      value: "give-a-compliment-or-gesture".i18n(),
    ),
    Challenge(
      value: "name-10-capitals".i18n(),
    ),
    Challenge(
      value: "choose-someone-drink-2-shots-navel".i18n(),
    ),
    Challenge(
      value: "beer-has-lots-of-cups".i18n(),
    ),
    Challenge(
      value: "lucky-drink-whenever-want".i18n(),
    ),
    Challenge(
      value: "write-number-0-9".i18n(),
    ),
    Challenge(
      value: "what-color-s-perdigao".i18n(),
    ),
    Challenge(
      value: "truth-or-dare".i18n(),
    ),
    Challenge(
      value: "show-search-history".i18n(),
    ),
    Challenge(
      value: "drink-glass-homemade-serum".i18n(),
    ),
    Challenge(
      value: "relax-dont-drink-anything".i18n(),
    ),
    Challenge(
      value: "who-drank-king-rome-clothes".i18n(),
    ),
    Challenge(
      value: "do-dance-or-drink-4-gulps".i18n(),
    ),
    Challenge(
      value: "eat-garlic-clove-or-drink-1-shot".i18n(),
    ),
    Challenge(
      value: "lucky-no-shot-game".i18n(),
    ),
    Challenge(
      value: "tell-funny-story".i18n(),
    ),
    Challenge(
      value: "try-mixing-coke-and-beer".i18n(),
    ),
    Challenge(
      value: "congrats-2-gulp-pass".i18n(),
    ),
    Challenge(
      value: "fill-cup-add-shot-alcohol".i18n(),
    ),
    Challenge(
      value: "swap-your-cup-for-water".i18n(),
    ),
    Challenge(
      value: "if-you-are-single-choose-single".i18n(),
    ),
    Challenge(
      value: "what-animal-never-walks-alone".i18n(),
    ),
    Challenge(
      value: "count-odd-numbers-to-31".i18n(),
    ),
    Challenge(
      value: "dance-if-you-feel-like".i18n(),
    ),
    Challenge(
      value: "who-speaks-one-language-flip-cup".i18n(),
    ),
    Challenge(
      value: "singles-drink-3-gulps".i18n(),
    ),
    Challenge(
      value: "cheers-drink-3-gulps".i18n(),
    ),
    Challenge(
      value: "first-to-drink-buys-everyone-drink".i18n(),
    ),
    Challenge(
      value: "most-energetic-drinks-4-gulps".i18n(),
    ),
    Challenge(
      value: "calmest-drinks-4-gulps".i18n(),
    ),
    Challenge(
      value: "everyone-wins-lottery-drinks-shot".i18n(),
    ),
    Challenge(
      value: "parents-drink-one-shot-per-child".i18n(),
    ),
    Challenge(
      value: "childless-drink-whatever".i18n(),
    ),
    Challenge(
      value: "married-drink-3-gulps".i18n(),
    ),
    Challenge(
      value: "if-age-even-number-drink-4-gulps".i18n(),
    ),
    Challenge(
      value: "wear-extra-clothing-piece".i18n(),
    ),
    Challenge(
      value: "divide-birthday-day-month".i18n(),
    ),
    Challenge(
      value: "choose-biggest-eater".i18n(),
    ),
    Challenge(
      value: "first-to-fart-gets-2-gulp-pass".i18n(),
    ),
    Challenge(
      value: "drink-everything-on-table".i18n(),
    ),
    Challenge(
      value: "play-until-someone-loses-flip-cup".i18n(),
    ),
    Challenge(
      value: "house-treat-everyone-fill-cups".i18n(),
    ),
    Challenge(
      value: "left-handed-drink-4-gulps".i18n(),
    ),
    Challenge(
      value: "everyone-drinks".i18n(),
    ),
    Challenge(
      value: "everyone-says-song-phrase".i18n(),
    ),
    Challenge(
      value: "continue".i18n(),
    ),
    // ALL
    Challenge(
      value: "who-speaks-one-language-flip-cup".i18n(),
      all: true,
    ),
    Challenge(
      value: "singles-drink-3-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "first-to-drink-buys-everyone-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "most-energetic-drinks-4-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "calmest-drinks-4-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "everyone-wins-lottery-drinks-shot".i18n(),
      all: true,
    ),
    Challenge(
      value: "parents-drink-one-shot-per-child".i18n(),
      all: true,
    ),
    Challenge(
      value: "childless-drink-whatever".i18n(),
      all: true,
    ),
    Challenge(
      value: "married-drink-3-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "if-age-even-number-drink-4-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "wear-extra-clothing-piece".i18n(),
      all: true,
    ),
    Challenge(
      value: "divide-birthday-day-month".i18n(),
      all: true,
    ),
    Challenge(
      value: "choose-biggest-eater".i18n(),
      all: true,
    ),
    Challenge(
      value: "first-to-fart-gets-2-gulp-pass".i18n(),
      all: true,
    ),
    Challenge(
      value: "drink-everything-on-table".i18n(),
      all: true,
    ),
    Challenge(
      value: "play-until-someone-loses-flip-cup".i18n(),
      all: true,
    ),
    Challenge(
      value: "house-treat-everyone-fill-cups".i18n(),
      all: true,
    ),
    Challenge(
      value: "left-handed-drink-4-gulps".i18n(),
      all: true,
    ),
    Challenge(
      value: "everyone-drinks".i18n(),
      all: true,
    ),
    Challenge(
      value: "everyone-says-song-phrase".i18n(),
      all: true,
    ),
    Challenge(
      value: "continue".i18n(),
      all: true,
    ),
  ];
}

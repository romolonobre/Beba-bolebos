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
      value: "drink-3-sips".i18n(),
    ),
    Challenge(
      value: "make-one-for-us-do-it".i18n(),
    ),
    Challenge(
      value: "drink-whenever-you-want".i18n(),
    ),
    Challenge(
      value: "won-2-sip-passes".i18n(),
    ),
    Challenge(
      value: "largest-star-solar-system".i18n(),
    ),
    Challenge(
      value: "drink-shot-stop-being-silly".i18n(),
    ),
    Challenge(
      value: "born-in-rio-de-janeiro".i18n(),
    ),
    Challenge(
      value: "are-you-okay".i18n(),
    ),
    Challenge(
      value: "shot-lemon-salt".i18n(),
    ),
    Challenge(
      value: "make-choice".i18n(),
    ),
    Challenge(
      value: "you-and-friends-drink".i18n(),
    ),
    Challenge(
      value: "challenge-flip-cup".i18n(),
    ),
    Challenge(
      value: "share-secret".i18n(),
    ),
    Challenge(
      value: "full-cup-drink".i18n(),
    ),
    Challenge(
      value: "funniest-drink-shot".i18n(),
    ),
    Challenge(
      value: "sit-out-5-min".i18n(),
    ),
    Challenge(
      value: "make-funny-gesture".i18n(),
    ),
    Challenge(
      value: "dance-choose-drink".i18n(),
    ),
    Challenge(
      value: "choose-next-3-songs".i18n(),
    ),
    Challenge(
      value: "drink-water-good".i18n(),
    ),
    Challenge(
      value: "nickname-left-player".i18n(),
    ),
    Challenge(
      value: "what-is-it".i18n(),
    ),
    Challenge(
      value: "confess-flaw".i18n(),
    ),
    Challenge(
      value: "fill-water-drink".i18n(),
    ),
    Challenge(
      value: "drink-2-sips-upside-down".i18n(),
    ),
    Challenge(
      value: "take-10-min-break".i18n(),
    ),
    Challenge(
      value: "no-get-up-20-min".i18n(),
    ),
    Challenge(
      value: "choose-kiss".i18n(),
    ),
    Challenge(
      value: "make-laugh-drink".i18n(),
    ),
    Challenge(
      value: "say-praise-funny-gesture".i18n(),
    ),
    Challenge(
      value: "name-10-capitals-20-sec".i18n(),
    ),
    Challenge(
      value: "drink-2-shots-navel".i18n(),
    ),
    Challenge(
      value: "beer-lot-drink".i18n(),
    ),
    Challenge(
      value: "lucky-drink-whenever".i18n(),
    ),
    Challenge(
      value: "guess-number-drink-passes".i18n(),
    ),
    Challenge(
      value: "perdigao-s-color".i18n(),
    ),
    Challenge(
      value: "truth-or-dare".i18n(),
    ),
    Challenge(
      value: "show-search-history".i18n(),
    ),
    Challenge(
      value: "drink-glass-oral-rehydration".i18n(),
    ),
    Challenge(
      value: "no-need-drink".i18n(),
    ),
    Challenge(
      value: "who-drank-king-rome".i18n(),
    ),
    Challenge(
      value: "dance-drink-4-sips".i18n(),
    ),
    Challenge(
      value: "eat-garlic-drink-shot".i18n(),
    ),
    Challenge(
      value: "lucky-no-shots".i18n(),
    ),
    Challenge(
      value: "funny-story-6-sips".i18n(),
    ),
    Challenge(
      value: "mix-coke-beer".i18n(),
    ),
    Challenge(
      value: "congrats-2-sip-passes".i18n(),
    ),
    Challenge(
      value: "fill-cup-add-shot".i18n(),
    ),
    Challenge(
      value: "switch-cup-water".i18n(),
    ),
    Challenge(
      value: "if-single-choose-single-lap".i18n(),
    ),
    Challenge(
      value: "what-animal-never-alone".i18n(),
    ),
    Challenge(
      value: "odd-numbers-31-15-sec".i18n(),
    ),
    Challenge(
      value: "dance-if-energy-drink-5-sips".i18n(),
    ),
    // ALL
    Challenge(
      value: "all-drink-language".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-singles-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-drink-3-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-first-drink-pay".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-most-excited-4-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-most-calm-4-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-won-lottery-shot".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-parents-drink-shots".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-no-kids-drink-want".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-married-3-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-even-age-4-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-extra-clothing-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-birthday-divide-month".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-pick-big-eater".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-first-fart-2-sip-passes".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-drink-table-no-spill".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-play-until-wrong".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-house-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-left-handed-4-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-drink-all".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-make-compliment".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-women-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-men-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-touch-phone-2-shots".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-smokers-3-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-smoked-weed-3-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-used-illicit-4-sips".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-no-respect-shot".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-women-party-drink".i18n(),
      all: true,
    ),
    Challenge(
      value: "all-each-finger-drink".i18n(),
      all: true,
    ),
    // MULTIPLO
    Challenge(
      value: "helper-for-10-min".i18n(),
      valueB: " por 10 minutos.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "suck-finger-4-sips".i18n(),
      valueB: " ou beba 4 goles.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "lick-arm-1-shot".i18n(),
      valueB: " ou beba 1 shot.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "chug-drink-of".i18n(),
      valueB: "".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "give-5-hugs".i18n(),
      valueB: " ou dê 5 abraços.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "smile-all-1-shot".i18n(),
      valueB: " ou beba 1 shot.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "how-many-dares".i18n(),
      valueB: " desafios.".i18n(),
      multiplo: true,
    ),
    Challenge(
      value: "help-player-multiple-4-sips".i18n(),
      valueB: " ou beba 4 goles.".i18n(),
      multiplo: true,
    ),
  ];
}

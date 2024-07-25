import 'package:flutter/material.dart';
import 'package:friends_game/game_screen.dart';
import 'package:friends_game/main.dart';
import 'package:friends_game/widgtes/add_player_input_widget.dart';
import 'package:friends_game/widgtes/custom_elevated_button.dart';
import 'package:localization/localization.dart';

import 'app_cache.dart';
import 'bobelos_controller.dart';
import 'widgtes/custom_text.dart';
import 'widgtes/custom_text_button.dart';
import 'widgtes/playes_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = BolelosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF27313c),
        body: ValueListenableBuilder(
          valueListenable: controller.names,
          builder: (_, names, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    //
                    // Add player input
                    AddPlayerInputWidget(controller),
                    const SizedBox(height: 15),
                    //
                    // Add player button
                    CustomElevatedButton(
                        text: "add-player".i18n(),
                        onPressed: () {
                          if (controller.playerName.value.isNotEmpty) {
                            controller.addPlayer(controller.playerName.value);
                          }
                        }),

                    const SizedBox(height: 15),
                    //
                    // lets play button
                    CustomTextButton(
                      text: "lets-play".i18n(),
                      onPressed: () async {
                        if (names.isNotEmpty) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GameScreen(names)),
                          );
                        }
                        setState(() => names = []);
                      },
                    ),
                    const SizedBox(height: 20),

                    //
                    // List of playes
                    PlayesListWidget(controller),

                    //
                    // Change language button
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextButton(
                        text: "change-language".i18n(),
                        onPressed: () {
                          showLanguageBottomSheet(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Future<void> showLanguageBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: CustomText(
                  'english'.i18n(),
                  color: Colors.black,
                  fontSize: 18,
                ),
                onTap: () => _onLanguageSelected(context, 'en'),
              ),
              ListTile(
                title: CustomText(
                  'português'.i18n(),
                  color: Colors.black,
                  fontSize: 18,
                ),
                onTap: () => _onLanguageSelected(context, 'pt'),
              ),
              ListTile(
                title: CustomText(
                  'español'.i18n(),
                  color: Colors.black,
                  fontSize: 18,
                ),
                onTap: () => _onLanguageSelected(context, 'es'),
              ),
              ListTile(
                title: CustomText(
                  'italiano'.i18n(),
                  color: Colors.black,
                  fontSize: 18,
                ),
                onTap: () => _onLanguageSelected(context, 'it'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Use this as flutter complains whne use 'BuildContext's across async gaps
  setLocale(String locale) async => await AppCache().setLocale(locale);

  Future<void> _onLanguageSelected(BuildContext context, String locale) async {
    setLocale(locale);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BebaBolebosApp()),
      (Route<dynamic> route) => false,
    );
  }
}

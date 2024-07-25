import 'package:flutter/material.dart';
import 'package:friends_game/game_screen.dart';
import 'package:friends_game/main.dart';
import 'package:friends_game/widgtes/custom_elevated_button.dart';
import 'package:localization/localization.dart';

import 'app_cache.dart';
import 'widgtes/custom_text.dart';
import 'widgtes/custom_text_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String playerName = '';
  List<String> _names = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF27313c),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            //
            // Add player input
            TextField(
              autofocus: true,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "add-new-player".i18n(),
                  labelStyle: const TextStyle(
                    color: Color(0XFFff3333),
                  )),
              onChanged: (name) {
                playerName = name;
              },
            ),
            const SizedBox(height: 15),
            //
            // Add player button
            CustomElevatedButton(
                text: "add-player".i18n(),
                onPressed: () {
                  if (playerName.isNotEmpty) {
                    setState(() {
                      _names.add(playerName);
                      playerName = '';
                    });
                  }
                }),

            const SizedBox(height: 15),
            //
            // Add player button
            CustomTextButton(
              text: "lets-play".i18n(),
              onPressed: () async {
                if (_names.isNotEmpty) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen(_names)),
                  );
                }
                setState(() => _names = []);
              },
            ),
            const SizedBox(height: 20),

            //
            // List of playes
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        _names[index],
                        fontSize: 20,
                      ),
                      const Divider(
                        color: Colors.white,
                      )
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
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

  setLocale(String locale) async {
    await AppCache().setLocale(locale);
  }

  Future<void> _onLanguageSelected(BuildContext context, String locale) async {
    setLocale(locale);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BebaBolebosApp()),
      (Route<dynamic> route) => false,
    );
  }
}

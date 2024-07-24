import 'package:flutter/material.dart';
import 'package:friends_game/game_screen.dart';
import 'package:friends_game/widgtes/custom_elevated_button.dart';

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
                  labelText: 'Add new palyer',
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
                text: "ADD PLAYER",
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
              text: "LETS PLAY!",
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
                        text: _names[index],
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../bobelos_controller.dart';

class AddPlayerInputWidget extends StatelessWidget {
  final BolelosController controller;

  const AddPlayerInputWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onChanged: (value) {
        controller.playerName.value = value;
      },
      onEditingComplete: () {
        if (controller.playerName.value.isNotEmpty) {
          controller.addPlayer(controller.playerName.value);
        }
      },
    );
  }
}

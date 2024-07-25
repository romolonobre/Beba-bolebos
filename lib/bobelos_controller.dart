import 'package:flutter/material.dart';

class BolelosController {
  final names = ValueNotifier<List<String>>([]);
  final playerName = ValueNotifier<String>('');

  void addPlayer(String playerName) {
    final updatedNames = List<String>.from(names.value);
    updatedNames.add(playerName);
    names.value = updatedNames;
  }
}

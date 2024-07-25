import 'package:flutter/material.dart';
import 'package:friends_game/widgtes/custom_text.dart';

import '../bobelos_controller.dart';

class PlayesListWidget extends StatefulWidget {
  final BolelosController controller;

  const PlayesListWidget(this.controller, {super.key});

  @override
  State<PlayesListWidget> createState() => _PlayesListWidgetState();
}

class _PlayesListWidgetState extends State<PlayesListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.names,
      builder: (_, names, child) {
        return SizedBox(
            height: 450,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.controller.names.value.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: CustomText(
                        names[index],
                        fontSize: 18,
                      ),
                      subtitle: const Divider(
                        color: Colors.white,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            names.removeAt(index);
                            setState(() {});
                          },
                        ),
                      )),
                );
              },
            ));
      },
    );
  }
}

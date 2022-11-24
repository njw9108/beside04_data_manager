import 'package:beside04_data_manager/presentation/home/components/word_adding/word_adding_widget.dart';
import 'package:flutter/material.dart';

class WordAddingOverlayMenu {
  late BuildContext context;
  late Function(List<String>) wordReturn;
  List<String> addedWords = [];

  WordAddingOverlayMenu();

  late OverlayEntry overlay = OverlayEntry(
    builder: (_) {
      return WordAddingWidget(
        onClose: removeMenu,
        wordReturn: wordReturn,
      );
    },
  );

  bool isActive = false;

  void showMenu(
      Function(List<String>) wordReturn) async {
    if (isActive == false) {
      this.wordReturn = wordReturn;
      isActive = true;
      Navigator.of(context).overlay!.insert(overlay);
    }
  }

  void removeMenu() {
    isActive = false;
    overlay.remove();
  }
}

import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_overlay/emoticon_select_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmoticonOverlayMenu {
  late BuildContext context;
  late List<EmoticonData> emoticonList;
  late Function(String) onEmoticonSelect;

  EmoticonOverlayMenu();

  late OverlayEntry overlay = OverlayEntry(
    builder: (_) => EmoticonSelectWidget(
      onClose: removeMenu,
      emoticonList: emoticonList,
      onEmoticonSelect: onEmoticonSelect,
    ),
  );

  bool isActive = false;

  void showMenu(
      List<EmoticonData> emoticonList, Function(String) onEmoticonSelect) async {
    if (isActive == false) {
      this.emoticonList = emoticonList;
      this.onEmoticonSelect = onEmoticonSelect;

      isActive = true;
      Navigator.of(context).overlay!.insert(overlay);
    }
  }

  void removeMenu() {
    isActive = false;
    overlay.remove();
  }
}

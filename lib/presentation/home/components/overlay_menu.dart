import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayMenu {
  late BuildContext context;

  OverlayMenu();

  late OverlayEntry overlay = OverlayEntry(
      builder: (_) => OverlayMenuWidget(
            onClose: removeMenu,
          ));

  bool isActive = false;

  void showMenu() async {
    if (isActive == false) {
      isActive = true;
      Navigator.of(context).overlay!.insert(overlay);
    }
  }

  void removeMenu() {
    isActive = false;
    overlay.remove();
  }
}

class OverlayMenuWidget extends StatelessWidget {
  final Function() onClose;

  const OverlayMenuWidget({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.red,
          child: Container(
            width: 600,
            height: 400,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: onClose,
                    child: Text('Close'),
                  ),
                ),
                Text('test'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

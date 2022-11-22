import 'package:beside04_data_manager/domain/model/wise_saying_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayMenu {
  late BuildContext context;
  late List<WiseSayingData> wiseSayings;

  OverlayMenu();

  late OverlayEntry overlay = OverlayEntry(
      builder: (_) => OverlayMenuWidget(
            onClose: removeMenu,
            wiseSayings: wiseSayings,
          ));

  bool isActive = false;

  void showMenu(List<WiseSayingData> data) async {
    if (isActive == false) {
      wiseSayings = data;
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
  final List<WiseSayingData> wiseSayings;

  const OverlayMenuWidget({
    Key? key,
    required this.onClose,
    required this.wiseSayings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          child: Container(
            width: 660,
            height: 600,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: onClose,
                      child: const Text('Close'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Container(
                    color: Colors.greenAccent,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: wiseSayings
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: false, onChanged: (value) {}),
                                    Text(
                                      e.wiseSaying,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: onClose,
                      child: const Text('선택 명언 적용'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: wiseSayings
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

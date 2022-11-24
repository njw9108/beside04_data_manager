import 'package:flutter/material.dart';

class WordAddingWidget extends StatefulWidget {
  final Function() onClose;
  final Function(List<String>) wordReturn;

  const WordAddingWidget({
    Key? key,
    required this.onClose,
    required this.wordReturn,
  }) : super(key: key);

  @override
  State<WordAddingWidget> createState() => _WordAddingWidgetState();
}

class _WordAddingWidgetState extends State<WordAddingWidget> {
  TextEditingController controller = TextEditingController();
  List<String> addedWords = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.limeAccent.withOpacity(0.5),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (controller.text.trim().isNotEmpty) {
                              addedWords.add(controller.text.trim());
                              controller.text = '';
                            }
                          });
                        },
                        child: const Text('추가'))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    child: Column(
                      children: addedWords.map((e) => Text(e)).toList(),
                    ),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.wordReturn(List.from(addedWords));
                        widget.onClose();
                      },
                      child: const Text('적용'),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.onClose();
                      },
                      child: const Text('닫기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

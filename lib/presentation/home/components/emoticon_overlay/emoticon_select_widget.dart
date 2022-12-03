import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmoticonSelectWidget extends StatelessWidget {
  final Function() onClose;
  final Function(String) onEmoticonSelect;
  final List<EmoticonData> emoticonList;

  const EmoticonSelectWidget({
    Key? key,
    required this.onClose,
    required this.emoticonList,
    required this.onEmoticonSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double emoticonSize = Responsive.isMobile(context) ? 50 : 80;
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          child: Container(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.6
                : 400,
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
            ),
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
                Container(
                  height: 400,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: GridView.builder(
                    itemCount: emoticonList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 3,
                      //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1,
                      //가로 세로 비율
                      mainAxisSpacing: 10,
                      //수평 Padding
                      crossAxisSpacing: 10, //수직 Padding
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            onEmoticonSelect(emoticonList[index].emoticon);
                            onClose();
                          },
                          child: Column(
                            children: [
                              SvgPicture.network(
                                emoticonList[index].emoticon,
                                width: emoticonSize,
                                height: emoticonSize,
                              ),
                              Text(
                                emoticonList[index].desc,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmoticonSelectWidget extends StatelessWidget {
  const EmoticonSelectWidget({
    Key? key,
    required this.matchingData,
    required this.emoticonWordsData,
  }) : super(key: key);

  final MatchingData matchingData;
  final EmoticonWordsData emoticonWordsData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewModel>();
    final state = controller.state;
    print(emoticonWordsData.emoticon.emoticon);

    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: InkWell(
        onTap: () {
          // controller.emoticonMenu.showMenu(
          //   state.value.emoticons,
          //   (emoticon) {
          //     controller.setEmoticon(matchingData, emoticonWordsData, emoticon);
          //   },
          // );
        },
        child: emoticonWordsData.emoticon.emoticon.isEmpty
            ? const Center(
                child: Text(
                  '이모티콘 선택',
                  textAlign: TextAlign.center,
                ),
              )
            : Image.network(
                emoticonWordsData.emoticon.emoticon,
              ),

      ),
    );
  }
}

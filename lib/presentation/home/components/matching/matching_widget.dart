import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_words/emoticon_words_widget.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchingWidget extends StatelessWidget {
  final MatchingData matchingData;

  const MatchingWidget({
    required this.matchingData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewModel>();
    final state = controller.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${state.value.currentPage * 10 + state.value.matchingList.indexOf(matchingData) + 1}. ',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
                flex: 9,
                child: Text(
                  '${matchingData.wiseSaying.message} \n- ${matchingData.wiseSaying.author}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ...matchingData.emoticonWordsList.map(
          (emoticonWordsData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: EmoticonWordsWidget(
                matchingData: matchingData,
                emoticonWordsData: emoticonWordsData,
              ),
            );
          },
        ).toList(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                controller.addEmoticonWords(matchingData);
              },
              child: const Text('이모티콘 추가'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 1,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:beside04_data_manager/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordsAddWidget extends StatelessWidget {
  const WordsAddWidget({
    Key? key,
    required this.matchingData,
    required this.emoticonWordsData,
  }) : super(key: key);

  final MatchingData matchingData;
  final EmoticonWordsData emoticonWordsData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewModel>();

    return Container(
      width: 500,
      height: 220,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.cyanAccent,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.wordMenu.showMenu(
                  (words) {
                    controller.addWords(matchingData, emoticonWordsData, words);
                  },
                );
              },
              child: const Text('단어 추가'),
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: emoticonWordsData.words.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //1 개의 행에 보여줄 item 개수
                  childAspectRatio: Responsive.isMobile(context) ? 1 : 2 / 1,
                  //가로 세로 비율
                  mainAxisSpacing: 10,
                  //수평 Padding
                  crossAxisSpacing: 10, //수직 Padding
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: Responsive.isMobile(context) ? 2 : 3,
                            child: Text(
                              emoticonWordsData.words[index],
                              maxLines: 2,
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  controller.deleteWord(
                                      matchingData, emoticonWordsData, index);
                                },
                                icon: const Icon(Icons.close)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

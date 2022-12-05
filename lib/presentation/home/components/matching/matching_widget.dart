import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_words/emoticon_words_widget.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:beside04_data_manager/responsive/responsive.dart';
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
    final matchingIndex = state.value.matchingList.indexOf(matchingData);

    return Obx(() {
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
          ElevatedButton(
            onPressed: () {
              openList[matchingIndex] = !openList[matchingIndex];
            },
            child: const Text('펼치기'),
          ),
          if (openList[matchingIndex])
            GridView.builder(
              shrinkWrap: true,
              itemCount: matchingData.emoticonWordsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
                //1 개의 행에 보여줄 item 개수
                childAspectRatio: Responsive.isDesktop(context)
                    ? 2
                    : Responsive.isTablet(context)
                        ? 1
                        : 0.7,
                //가로 세로 비율
                mainAxisSpacing: 10,
                //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: EmoticonWordsWidget(
                    matchingData: matchingData,
                    emoticonWordsData: matchingData.emoticonWordsList[index],
                  ),
                );
              },
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
    });
  }
}

import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_words/components/emoticon_select_widget.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_words/components/words_add_widget.dart';
import 'package:beside04_data_manager/responsive/responsive.dart';
import 'package:flutter/material.dart';

class EmoticonWordsWidget extends StatelessWidget {
  const EmoticonWordsWidget({
    Key? key,
    required this.matchingData,
    required this.emoticonWordsData,
  }) : super(key: key);

  final MatchingData matchingData;
  final EmoticonWordsData emoticonWordsData;

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmoticonSelectWidget(
                matchingData: matchingData,
                emoticonWordsData: emoticonWordsData,
              ),
              const SizedBox(
                width: 30,
              ),
              WordsAddWidget(
                  matchingData: matchingData,
                  emoticonWordsData: emoticonWordsData),
            ],
          )
        : Center(
            child: Column(
              children: [
                EmoticonSelectWidget(
                  matchingData: matchingData,
                  emoticonWordsData: emoticonWordsData,
                ),
                const SizedBox(
                  height: 30,
                ),
                WordsAddWidget(
                    matchingData: matchingData,
                    emoticonWordsData: emoticonWordsData),
              ],
            ),
          );
  }
}

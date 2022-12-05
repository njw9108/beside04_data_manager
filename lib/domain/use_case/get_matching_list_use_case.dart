import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';
import 'package:beside04_data_manager/domain/repository/words_repository.dart';

class GetMatchingListUseCase {
  final MatchingRepository matchingRepository;
  final WordsRepository wordsRepository;

  GetMatchingListUseCase({
    required this.matchingRepository,
    required this.wordsRepository,
  });

  Future<Result<Map<String, dynamic>>> call({
    required int limit,
    required int page,
    required List<EmoticonData> emoticons,
  }) async {
    final result = await matchingRepository.getWiseData(limit, page);
    List<MatchingData> matchingDataList = [];
    List<EmoticonWordsData> emoticonWordList = [];

    final Result<Map<String, dynamic>> returnValue =
        await result.when(success: (data) async {
      for (int i = 0; i < data.wiseData.length; i++) {
        emoticonWordList =
            await getEmoticonWordsData(emoticons, data.wiseData[i]);

        matchingDataList.add(
          MatchingData(
            wiseSaying: data.wiseData[i],
            emoticonWordsList: emoticonWordList,
          ),
        );
      }

      return Result.success({
        'curPage': data.currentPage,
        'totalPage': data.totalPage,
        'matchingDataList': matchingDataList,
      });
    }, error: (message) {
      return Result.error(message);
    });

    return returnValue;
  }

  Future<List<EmoticonWordsData>> getEmoticonWordsData(
      List<EmoticonData> emoticons, WiseData wise) async {
    List<EmoticonWordsData> emoticonWordsList = [];

    for (int i = 0; i < emoticons.length; i++) {
      final List<String> getWordsResult = await getWords(emoticons[i], wise);

      emoticonWordsList.add(
        EmoticonWordsData(
          emoticon: emoticons[i],
          words: getWordsResult,
        ),
      );
    }

    return emoticonWordsList;
  }

  Future<List<String>> getWords(EmoticonData emoticon, WiseData wise) async {
    List<String> words = [];
    final wordsResult =
        await wordsRepository.getWordList(emoticon.id ?? 0, wise.id ?? 0);
    wordsResult.when(
      success: (data) {
        words = List.from(data);
      },
      error: (message) {},
    );

    return words;
  }
}

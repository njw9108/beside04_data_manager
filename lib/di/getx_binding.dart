import 'package:beside04_data_manager/data/repository/emoticon_repository_impl.dart';
import 'package:beside04_data_manager/data/repository/matching_repository_impl.dart';
import 'package:beside04_data_manager/data/repository/words_repository_impl.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_matching_list_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/update_words_use_case.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final emoticonRepository = EmoticonRepositoryImpl();
final matchingRepository = MatchingRepositoryImpl();
final wordsRepository = WordsRepositoryImpl();

final GetEmoticonUseCase getEmoticonUseCase = GetEmoticonUseCase(
  emoticonRepository: emoticonRepository,
);

final GetMatchingListUseCase getMatchingListUseCase = GetMatchingListUseCase(
  matchingRepository: matchingRepository,
  wordsRepository: wordsRepository,
);

final UpdateWordsUseCase updateWordsUseCase = UpdateWordsUseCase(
  wordsRepository: wordsRepository,
);

void getHomeBinding(BuildContext context) {
  Get.put(HomeViewModel(
    getEmoticonUseCase: getEmoticonUseCase,
    getMatchingListUseCase: getMatchingListUseCase,
    context: context,
    updateWordsUseCase: updateWordsUseCase,
  ));
}

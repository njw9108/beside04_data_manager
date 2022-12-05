import 'dart:async';

import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_matching_list_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/update_words_use_case.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_overlay/emoticon_overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/components/word_adding/word_adding_overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const int limit = 10;
List<bool> openList = List.generate(limit, (index) => false).obs;

class HomeViewModel extends GetxController {
  final GetEmoticonUseCase getEmoticonUseCase;
  final GetMatchingListUseCase getMatchingListUseCase;
  final UpdateWordsUseCase updateWordsUseCase;
  final BuildContext context;
  final TextEditingController curPageController = TextEditingController();

  HomeViewModel({
    required this.getEmoticonUseCase,
    required this.getMatchingListUseCase,
    required this.updateWordsUseCase,
    required this.context,
  }) {
    fetchData();
  }

  final EmoticonOverlayMenu _emoticonMenu = EmoticonOverlayMenu();

  EmoticonOverlayMenu get emoticonMenu => _emoticonMenu;

  final WordAddingOverlayMenu _wordMenu = WordAddingOverlayMenu();

  WordAddingOverlayMenu get wordMenu => _wordMenu;

  @override
  void onInit() {
    _emoticonMenu.context = context;
    _wordMenu.context = context;

    super.onInit();
  }

  @override
  void dispose() {
    curPageController.dispose();
    super.dispose();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  Future<void> setPage(int page) async {
    if (page - 1 < 0 || page - 1 > state.value.totalPage) {
      return;
    }

    await getMatchingData(page - 1);
  }

  Future<void> getNextPage() async {
    if (state.value.currentPage >= state.value.totalPage) {
      return;
    }

    await getMatchingData(state.value.currentPage + 1);
  }

  Future<void> getPrevPage() async {
    if (state.value.currentPage <= 0) {
      return;
    }

    await getMatchingData(state.value.currentPage - 1);
  }

  Future<void> fetchData() async {
    await getEmoticons();

    await getMatchingData(0);
  }

  Future<void> getEmoticons() async {
    int limit = 100;
    int page = 0;
    final emoticons = await getEmoticonUseCase(limit, page);
    emoticons.when(
      success: (emoticonList) {
        _state.value = state.value.copyWith(
          emoticons: emoticonList,
        );
      },
      error: (message) {
        Get.snackbar('에러', message);
      },
    );
  }

  Future<void> getMatchingData(int page) async {
    int curPage = 0;
    int totalPage = 0;
    List<MatchingData> matchingList = [];

    _state.value = state.value.copyWith(
      isLoading: true,
    );
    final result = await getMatchingListUseCase(
      limit: limit,
      page: page,
      emoticons: state.value.emoticons,
    );

    result.when(success: (data) {
      curPage = data['curPage'];
      totalPage = data['totalPage'];
      matchingList = data['matchingDataList'];
    }, error: (message) {
      Get.snackbar('에러', message);
    });

    _state.value = state.value.copyWith(
      matchingList: matchingList,
      currentPage: curPage,
      totalPage: totalPage,
      isLoading: false,
    );
    openList.setRange(0, limit - 1, List.generate(limit, (index) => false));
  }

  void setEmoticon(MatchingData matchingData,
      EmoticonWordsData emoticonWordsData, EmoticonData emoticon) {
    final matchingIndex = state.value.matchingList.indexOf(matchingData);
    List<MatchingData> newMatchingList = List.from(state.value.matchingList);

    final emoticonWordsIndex = newMatchingList[matchingIndex]
        .emoticonWordsList
        .indexOf(emoticonWordsData);
    List<EmoticonWordsData> newEmoticonWordsList =
        List.from(newMatchingList[matchingIndex].emoticonWordsList);

    newEmoticonWordsList[emoticonWordsIndex] =
        emoticonWordsData.copyWith(emoticon: emoticon);

    newMatchingList[matchingIndex] = matchingData.copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );
    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }

  void addWords(MatchingData matchingData, EmoticonWordsData emoticonWordsData,
      List<String> words) {
    final matchingIndex = state.value.matchingList.indexOf(matchingData);
    List<MatchingData> newMatchingList = List.from(state.value.matchingList);

    final emoticonWordsIndex = newMatchingList[matchingIndex]
        .emoticonWordsList
        .indexOf(emoticonWordsData);
    List<EmoticonWordsData> newEmoticonWordsList =
        List.from(newMatchingList[matchingIndex].emoticonWordsList);

    List<String> newWords =
        List.from(newEmoticonWordsList[emoticonWordsIndex].words);

    newWords.addAll(words);

    newEmoticonWordsList[emoticonWordsIndex] =
        emoticonWordsData.copyWith(words: newWords.toSet().toList());

    updateWords(
      emoticonId: newEmoticonWordsList[emoticonWordsIndex].emoticon.id!,
      wiseId: matchingData.wiseSaying.id!,
      words: newWords,
    );

    newMatchingList[matchingIndex] = matchingData.copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );
    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }

  void deleteWord(MatchingData matchingData,
      EmoticonWordsData emoticonWordsData, int wordIndex) {
    final matchingIndex = state.value.matchingList.indexOf(matchingData);
    List<MatchingData> newMatchingList = List.from(state.value.matchingList);

    final emoticonWordsIndex = newMatchingList[matchingIndex]
        .emoticonWordsList
        .indexOf(emoticonWordsData);

    List<EmoticonWordsData> newEmoticonWordsList =
        List.from(newMatchingList[matchingIndex].emoticonWordsList);

    List<String> newWords =
        List.from(newEmoticonWordsList[emoticonWordsIndex].words);

    newWords.removeAt(wordIndex);

    newEmoticonWordsList[emoticonWordsIndex] =
        emoticonWordsData.copyWith(words: newWords);

    updateWords(
      emoticonId: newEmoticonWordsList[emoticonWordsIndex].emoticon.id!,
      wiseId: matchingData.wiseSaying.id!,
      words: newWords,
    );

    newMatchingList[matchingIndex] = matchingData.copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );
    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }

  Future<void> updateWords({
    required int emoticonId,
    required int wiseId,
    required List<String> words,
  }) async {
    await updateWordsUseCase(emoticonId, wiseId, words);
  }

  void updateOpenClose() {}
}

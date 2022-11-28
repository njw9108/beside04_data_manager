import 'dart:async';

import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_matching_list_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_wise_use_case.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_overlay/emoticon_overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/components/word_adding/word_adding_overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const int limit = 10;

class HomeViewModel extends GetxController {
  final GetEmoticonUseCase getEmoticonUseCase;
  final GetMatchingListUseCase getMatchingListUseCase;
  final BuildContext context;
  final GetWiseUseCase getWiseUseCase;
  final TextEditingController curPageController = TextEditingController();

  HomeViewModel({
    required this.getEmoticonUseCase,
    required this.getMatchingListUseCase,
    required this.context,
    required this.getWiseUseCase,
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

  Future<void> fetchData() async {
    //final matchingList = await getMatchingListUseCase();
    final emoticons = await getEmoticonUseCase();
    _state.value = state.value.copyWith(
      emoticons: emoticons,
    );

    await getWise(0);
  }

  Future<void> setPage(int page) async {
    if (page-1 < 0 || page-1 > state.value.totalPage) {
      return;
    }

    await getWise(page-1);

  }

  Future<void> getNextPage() async {
    if (state.value.currentPage >= state.value.totalPage) {
      return;
    }

    await getWise(state.value.currentPage + 1);
  }

  Future<void> getPrevPage() async {
    if (state.value.currentPage <= 0) {
      return;
    }

    await getWise(state.value.currentPage - 1);
  }

  Future<void> getWise(int page) async {
    _state.value = state.value.copyWith(
      isLoading: true,
    );
    final getWise = await getWiseUseCase(limit, page);
    int curPage = 0;
    int totalPage = 0;
    List<WiseData> wiseData = [];
    List<MatchingData> matchingList = [];

    getWise.when(success: (wise) {
      curPage = wise.currentPage;
      totalPage = wise.totalPage;
      wiseData = wise.wiseData;

      curPageController.text = '${curPage + 1}';
      matchingList = wiseData.map((e) => MatchingData(wiseSaying: e)).toList();
    }, error: (message) {
      Get.snackbar('에러', message);
    });

    _state.value = state.value.copyWith(
      matchingList: matchingList,
      wiseData: wiseData,
      currentPage: curPage,
      totalPage: totalPage,
      isLoading: false,
    );
  }

  void addEmoticonWords(MatchingData matchingData) {
    final index = state.value.matchingList.indexOf(matchingData);
    List<MatchingData> newMatchingDataList =
        List.from(state.value.matchingList);

    List<EmoticonWordsData> newEmoticonWordsList =
        List.from(newMatchingDataList[index].emoticonWordsList);

    newEmoticonWordsList.add(EmoticonWordsData());

    newMatchingDataList[index] = newMatchingDataList[index].copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );

    _state.value = state.value.copyWith(
      matchingList: newMatchingDataList,
    );
  }

  void setEmoticon(MatchingData matchingData,
      EmoticonWordsData emoticonWordsData, String emoticon) {
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
        emoticonWordsData.copyWith(words: newWords);

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

    newMatchingList[matchingIndex] = matchingData.copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );
    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }

  void deleteMatchingData(
      MatchingData matchingData, EmoticonWordsData emoticonWords) {
    final int matchingIndex = state.value.matchingList.indexOf(matchingData);
    List<MatchingData> newMatchingList = List.from(state.value.matchingList);

    List<EmoticonWordsData> newEmoticonWordsList =
        List.from(newMatchingList[matchingIndex].emoticonWordsList);

    newEmoticonWordsList.remove(emoticonWords);

    newMatchingList[matchingIndex] = newMatchingList[matchingIndex].copyWith(
      emoticonWordsList: newEmoticonWordsList,
    );

    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }
}

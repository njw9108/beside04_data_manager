import 'dart:async';

import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_matching_list_use_case.dart';
import 'package:beside04_data_manager/presentation/home/components/emoticon_overlay/emoticon_overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final GetEmoticonUseCase getEmoticonUseCase;
  final GetMatchingListUseCase getMatchingListUseCase;
  final BuildContext context;

  HomeViewModel({
    required this.getEmoticonUseCase,
    required this.getMatchingListUseCase,
    required this.context,
  }) {
    fetchData();
  }

  final EmoticonOverlayMenu _emoticonMenu = EmoticonOverlayMenu();

  EmoticonOverlayMenu get emoticonMenu => _emoticonMenu;

  @override
  void onInit() {
    _emoticonMenu.context = context;

    super.onInit();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  Future<void> fetchData() async {
    _state.value = state.value.copyWith(
      isLoading: true,
    );

    final matchingList = await getMatchingListUseCase();

    final emoticons = await getEmoticonUseCase();
    _state.value = state.value.copyWith(
      emoticons: emoticons,
      matchingList: matchingList,
      isLoading: false,
    );
  }

  void setEmoticon(MatchingData data, String emoticon) {
    final index = state.value.matchingList.indexOf(data);
    List<MatchingData> newMatchingList = List.from(state.value.matchingList);
    newMatchingList[index] = data.copyWith(
      emoticon: emoticon,
    );
    _state.value = state.value.copyWith(
      matchingList: newMatchingList,
    );
  }
}

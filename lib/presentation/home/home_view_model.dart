import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/presentation/home/components/overlay_menu.dart';
import 'package:beside04_data_manager/presentation/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final GetEmoticonUseCase getEmoticonUseCase;
  final BuildContext context;

  HomeViewModel({
    required this.getEmoticonUseCase,
    required this.context,
  }) {
    fetchData();
  }

  final OverlayMenu _menu = OverlayMenu();

  OverlayMenu get menu => _menu;

  @override
  void onInit() {
    _menu.context = context;

    super.onInit();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  Future<void> fetchData() async {
    _state.value = state.value.copyWith(
      isLoading: true,
    );

    final result = await getEmoticonUseCase();
    _state.value = state.value.copyWith(
      emoticons: result,
      isLoading: false,
    );
  }
}

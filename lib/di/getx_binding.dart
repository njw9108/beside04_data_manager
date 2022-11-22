import 'package:beside04_data_manager/data/repository/emoticon_repository_impl.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final emoticonRepository = EmoticonRepositoryImpl();

final GetEmoticonUseCase getEmoticonUseCase = GetEmoticonUseCase(
  emoticonRepository: emoticonRepository,
);

void getHomeBinding(BuildContext context) {
  Get.put(HomeViewModel(
    getEmoticonUseCase: getEmoticonUseCase,
    context: context,
  ));
}

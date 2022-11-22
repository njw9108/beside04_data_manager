import 'package:beside04_data_manager/data/repository/emoticon_repository_impl.dart';
import 'package:beside04_data_manager/data/repository/wise_saying_repository_impl.dart';
import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/domain/use_case/get_wise_saying_use_case.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final emoticonRepository = EmoticonRepositoryImpl();
final wiseSayingRepository = WiseSayingRepositoryImpl();

final GetEmoticonUseCase getEmoticonUseCase = GetEmoticonUseCase(
  emoticonRepository: emoticonRepository,
);

final GetWiseSayingUseCase getWiseSayingUseCase = GetWiseSayingUseCase(
  wiseSayingRepository: wiseSayingRepository,
);

void getHomeBinding(BuildContext context) {
  Get.put(HomeViewModel(
    getWiseSayingUseCase: getWiseSayingUseCase,
    getEmoticonUseCase: getEmoticonUseCase,
    context: context,
  ));
}

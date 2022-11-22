import 'package:beside04_data_manager/domain/use_case/get_emoticon_use_case.dart';
import 'package:beside04_data_manager/presentation/home/home_state.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final GetEmoticonUseCase getEmoticonUseCase;

  HomeViewModel({
    required this.getEmoticonUseCase,
  }) {
    fetchData();
  }

  final Rx<HomeState> _state = HomeState().obs;

  Rx<HomeState> get state => _state;

  Future<void> fetchData() async {
    _state.value = state.value.copyWith(
      isLoading: true,
    );

    final result = await getEmoticonUseCase();
    print(result);
    _state.value = state.value.copyWith(
      emoticons: result,
      isLoading: false,
    );
  }
}

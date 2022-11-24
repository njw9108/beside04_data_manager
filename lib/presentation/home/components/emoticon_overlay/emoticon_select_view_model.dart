import 'package:beside04_data_manager/presentation/home/components/emoticon_overlay/emoticon_select_state.dart';
import 'package:get/get.dart';

class WiseEditViewModel extends GetxController {
  final Rx<EmoticonSelectState> _state = EmoticonSelectState().obs;

  Rx<EmoticonSelectState> get state => _state;
}

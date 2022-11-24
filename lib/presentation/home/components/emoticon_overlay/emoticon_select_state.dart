import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'emoticon_select_state.freezed.dart';
part 'emoticon_select_state.g.dart';

@freezed
class EmoticonSelectState with _$EmoticonSelectState {
  factory EmoticonSelectState({
    @Default([]) List<EmoticonData> emoticonList,
  }) = _EmoticonSelectState;
  factory EmoticonSelectState.fromJson(Map<String, dynamic> json) => _$EmoticonSelectStateFromJson(json);
}
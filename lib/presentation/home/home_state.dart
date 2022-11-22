import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/model/wise_saying_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<WiseSayingData> wiseSayings,
    @Default([]) List<EmoticonData> emoticons,
    @Default(false) isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

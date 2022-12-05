import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<MatchingData> matchingList,
    @Default([]) List<EmoticonData> emoticons,
    @Default(0) int currentPage,
    @Default(0) int totalPage,
    @Default(false) isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

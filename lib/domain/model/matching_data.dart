import 'package:beside04_data_manager/domain/model/emoticon_words_data.dart';
import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'matching_data.freezed.dart';

part 'matching_data.g.dart';

@freezed
class MatchingData with _$MatchingData {
  factory MatchingData({
    required WiseData wiseSaying,
    @Default([]) List<EmoticonWordsData> emoticonWordsList,
  }) = _MatchingData;

  factory MatchingData.fromJson(Map<String, dynamic> json) =>
      _$MatchingDataFromJson(json);
}

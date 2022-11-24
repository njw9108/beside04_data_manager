import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emoticon_words_data.freezed.dart';

part 'emoticon_words_data.g.dart';

@freezed
class EmoticonWordsData with _$EmoticonWordsData {
  factory EmoticonWordsData({
    @Default('') String emoticon,
    @Default([]) List<String> words,
  }) = _EmoticonWordsData;

  factory EmoticonWordsData.fromJson(Map<String, dynamic> json) =>
      _$EmoticonWordsDataFromJson(json);
}

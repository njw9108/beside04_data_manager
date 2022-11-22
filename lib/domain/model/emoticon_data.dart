import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emoticon_data.freezed.dart';

part 'emoticon_data.g.dart';

@freezed
class EmoticonData with _$EmoticonData {
  factory EmoticonData(
      {@Default('') String emoticon,
      @Default('') String description}) = _EmoticonData;

  factory EmoticonData.fromJson(Map<String, dynamic> json) =>
      _$EmoticonDataFromJson(json);
}

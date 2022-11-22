import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wise_saying_data.freezed.dart';

part 'wise_saying_data.g.dart';

@freezed
class WiseSayingData with _$WiseSayingData {
  factory WiseSayingData({
    required String wiseSaying,
  }) = _WiseSayingData;

  factory WiseSayingData.fromJson(Map<String, dynamic> json) =>
      _$WiseSayingDataFromJson(json);
}

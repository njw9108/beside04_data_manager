import 'package:freezed_annotation/freezed_annotation.dart';

part 'wise_data.freezed.dart';

part 'wise_data.g.dart';

@freezed
class WiseData with _$WiseData {
  factory WiseData({
    @Default('') String author,
    @Default('') String message,
  }) = _WiseData;

  factory WiseData.fromJson(Map<String, dynamic> json) =>
      _$WiseDataFromJson(json);
}

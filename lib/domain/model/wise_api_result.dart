import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'wise_api_result.freezed.dart';
part 'wise_api_result.g.dart';

@freezed
class WiseApiResult with _$WiseApiResult {
  factory WiseApiResult({
    @Default(0) @JsonKey(name: 'total_page') int totalPage,
    @Default(0) @JsonKey(name: 'current_page') int currentPage,
    @Default([]) @JsonKey(name: 'data') List<WiseData> wiseData,
  }) = _WiseApiResult;
  factory WiseApiResult.fromJson(Map<String, dynamic> json) => _$WiseApiResultFromJson(json);
}
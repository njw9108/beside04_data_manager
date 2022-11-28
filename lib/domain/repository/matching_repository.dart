import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';

abstract class MatchingRepository {
  Future<List<MatchingData>> getMatchingData();

  Future<Result<WiseApiResult>> getWiseData(int limit, int page);
}

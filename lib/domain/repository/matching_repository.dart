import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';

abstract class MatchingRepository {
  Future<Result<WiseApiResult>> getWiseData(int limit, int page);
}

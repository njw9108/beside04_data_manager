import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/data/data_source/get_wise_data_source.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';

class MatchingRepositoryImpl implements MatchingRepository {
  final GetWiseDataSource _wiseDataSource = GetWiseDataSource();

  @override
  Future<Result<WiseApiResult>> getWiseData(int limit, int page) async {
    return _wiseDataSource.getWiseSaying(limit, page);
  }
}

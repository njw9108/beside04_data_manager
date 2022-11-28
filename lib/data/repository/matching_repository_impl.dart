import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/data/data_source/get_wise_data_source.dart';
import 'package:beside04_data_manager/data/data_source/matching_data_source.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';

class MatchingRepositoryImpl implements MatchingRepository {
  final MatchingDataSource _dataSource = MatchingDataSource();
  final GetWiseDataSource _wiseDataSource = GetWiseDataSource();

  @override
  Future<List<MatchingData>> getMatchingData() async {
    return await _dataSource.getMatchingList();
  }

  @override
  Future<Result<WiseApiResult>> getWiseData(int limit, int page) async {
    return _wiseDataSource.getWiseSaying(limit, page);
  }
}

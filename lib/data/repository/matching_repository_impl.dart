import 'package:beside04_data_manager/data/data_source/matching_data_source.dart';
import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';

class MatchingRepositoryImpl implements MatchingRepository {
  final MatchingDataSource _dataSource = MatchingDataSource();

  @override
  Future<List<MatchingData>> getMatchingData() async {
    return await _dataSource.getMatchingList();
  }
}

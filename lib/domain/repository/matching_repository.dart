import 'package:beside04_data_manager/domain/model/matching_data.dart';

abstract class MatchingRepository {
  Future<List<MatchingData>> getMatchingData();
}

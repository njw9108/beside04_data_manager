import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';

class GetWiseUseCase {
  final MatchingRepository matchingRepository;

  GetWiseUseCase({
    required this.matchingRepository,
  });

  Future<Result<WiseApiResult>> call(int limit, int page) async {
    return matchingRepository.getWiseData(limit, page);
  }
}

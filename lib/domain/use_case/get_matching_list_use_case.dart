import 'package:beside04_data_manager/domain/model/matching_data.dart';
import 'package:beside04_data_manager/domain/repository/matching_repository.dart';

class GetMatchingListUseCase {
  final MatchingRepository matchingRepository;

  GetMatchingListUseCase({
    required this.matchingRepository,
  });

  Future<List<MatchingData>> call() async {
    return await matchingRepository.getMatchingData();
  }
}

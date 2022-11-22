import 'package:beside04_data_manager/domain/model/wise_saying_data.dart';
import 'package:beside04_data_manager/domain/repository/wise_saying_repository.dart';

class GetWiseSayingUseCase {
  final WiseSayingRepository wiseSayingRepository;

  GetWiseSayingUseCase({
    required this.wiseSayingRepository,
  });

  Future<List<WiseSayingData>> call() async {
    return await wiseSayingRepository.getWiseSayings();
  }
}

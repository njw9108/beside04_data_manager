import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/repository/emoticon_repository.dart';

class GetEmoticonUseCase {
  final EmoticonRepository emoticonRepository;

  GetEmoticonUseCase({
    required this.emoticonRepository,
  });

  Future<List<EmoticonData>> call() async {
    return await emoticonRepository.getEmoticon();
  }
}

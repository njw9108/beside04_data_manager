import 'package:beside04_data_manager/domain/repository/words_repository.dart';

class UpdateWordsUseCase {
  final WordsRepository wordsRepository;

  UpdateWordsUseCase({
    required this.wordsRepository,
  });

  Future<bool> call(int emoticonId, int wiseId, List<String> words) async {
    return await wordsRepository.updateWordList(emoticonId, wiseId, words);
  }
}

import 'package:beside04_data_manager/core/result.dart';

abstract class WordsRepository {
  Future<Result<List<String>>> getWordList(int emoticonId, int wiseId);

  Future<bool> updateWordList(int emoticonId, int wiseId, List<String> words);
}

import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/data/data_source/words_data_source.dart';
import 'package:beside04_data_manager/domain/repository/words_repository.dart';

class WordsRepositoryImpl implements WordsRepository {
  final WordsDataSource _source = WordsDataSource();

  @override
  Future<Result<List<String>>> getWordList(int emoticonId, int wiseId) async {
    return await _source.getWords(emoticonId, wiseId);
  }

  @override
  Future<bool> updateWordList(int emoticonId, int wiseId, List<String> words) async{
    return await _source.updateWords(emoticonId, wiseId, words);

  }
}

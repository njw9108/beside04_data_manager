import 'package:beside04_data_manager/core/result.dart';
import 'package:dio/dio.dart';

class WordsDataSource {
  final String _baseUrl = 'https://harukitty.com/api';
  final Dio _client = Dio();

  Future<Result<List<String>>> getWords(int emoticonId, int wiseId) async {
    try {
      String emoticonUrl =
          '$_baseUrl/v1/emotions/$emoticonId/wisesaying/$wiseId/words';
      Response response;
      response = await _client.get(
        emoticonUrl,
      );

      if (response.data['status'] == 200) {
        final Iterable wordList = response.data['data'];
        final List<String> words =
            wordList.map((e) => e['word'].toString()).toList();

        return Result.success(words);
      } else {
        return Result.error(
            '[서버 error] status code : ${response.data['status']}');
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<bool> updateWords(
      int emoticonId, int wiseId, List<String> words) async {
    try {
      String emoticonUrl =
          '$_baseUrl/v1/emotions/$emoticonId/wisesaying/$wiseId/words';
      Response response;
      response = await _client.post(
        emoticonUrl,
        data: {
          "words": words,
        },
      );

      if (response.data['status'] == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

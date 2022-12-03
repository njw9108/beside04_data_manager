import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/emoticon_data.dart';

abstract class EmoticonRepository {
  Future<Result<List<EmoticonData>>> getEmoticon(int limit, int page);
}

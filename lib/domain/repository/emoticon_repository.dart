import 'package:beside04_data_manager/domain/model/emoticon_data.dart';

abstract class EmoticonRepository {
  Future<List<EmoticonData>> getEmoticon();
}

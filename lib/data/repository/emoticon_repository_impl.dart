import 'package:beside04_data_manager/data/data_source/emoticon_data_source.dart';
import 'package:beside04_data_manager/domain/model/emoticon_data.dart';
import 'package:beside04_data_manager/domain/repository/emoticon_repository.dart';

class EmoticonRepositoryImpl implements EmoticonRepository {
  final EmoticonDataSource _dataSource = EmoticonDataSource();

  @override
  Future<List<EmoticonData>> getEmoticon() async {
    return await _dataSource.getEmoticons();
  }
}

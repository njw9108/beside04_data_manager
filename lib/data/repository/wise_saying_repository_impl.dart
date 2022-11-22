import 'package:beside04_data_manager/data/data_source/wise_saying_data_source.dart';
import 'package:beside04_data_manager/domain/model/wise_saying_data.dart';
import 'package:beside04_data_manager/domain/repository/wise_saying_repository.dart';

class WiseSayingRepositoryImpl implements WiseSayingRepository {
  final WiseSayingDataSource _dataSource = WiseSayingDataSource();

  @override
  Future<List<WiseSayingData>> getWiseSayings() async {
    return await _dataSource.getWiseSayings();
  }
}

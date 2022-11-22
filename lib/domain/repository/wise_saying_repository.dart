import 'package:beside04_data_manager/domain/model/wise_saying_data.dart';

abstract class WiseSayingRepository {
  Future<List<WiseSayingData>> getWiseSayings();
}

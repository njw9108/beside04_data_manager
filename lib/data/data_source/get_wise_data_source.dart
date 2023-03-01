import 'package:beside04_data_manager/core/result.dart';
import 'package:beside04_data_manager/domain/model/wise_api_result.dart';
import 'package:beside04_data_manager/domain/model/wise_data.dart';
import 'package:dio/dio.dart';

class GetWiseDataSource {
  final String _baseUrl = 'https://harunyang.com/api';
  final Dio _client = Dio();

  Future<Result<WiseApiResult>> getWiseSaying(int limit, int page) async {
    try {
      String wiseUrl = '$_baseUrl/v1/wisesayings';
      Response response;
      response = await _client.get(
        wiseUrl,
        queryParameters: {
          'limitCount': limit,
          'page': page,
        },
      );

      if (response.data['status'] == 200) {
        final int totalPage = response.data['data']['total_page'];
        final int currentPage = response.data['data']['current_page'];
        final Iterable wiseIterable = response.data['data']['data'];
        final List<WiseData> wiseData =
            wiseIterable.map((e) => WiseData.fromJson(e)).toList();

        return Result.success(
          WiseApiResult(
            totalPage: totalPage,
            currentPage: currentPage,
            wiseData: wiseData,
          ),
        );
      } else {
        return Result.error(
            '서버 error : status code : ${response.data['status']}');
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

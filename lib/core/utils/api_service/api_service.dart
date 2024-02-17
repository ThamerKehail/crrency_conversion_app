import 'package:currency_converter_app/core/utils/constants/text_strings.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final String baseUrl = AppText.baseUrl;

  ApiService(this._dio);

  get({required String endPoint}) async {
    print('$baseUrl/$endPoint');
    Response response = await _dio.get(
      '$baseUrl/$endPoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required body}) async {
    Response response = await _dio.post(
      '$baseUrl/$endPoint',
      data: body,
      options: Options(headers: {
        "Authorization": "Bearer  ",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }),
    );
    return response.data;
  }

  postFormData({required String endPoint, required body}) async {
    Response response = await _dio.post('$baseUrl/$endPoint',
        data: FormData.fromMap(body),
        options: Options(headers: {
          "Authorization": "Bearer  ",
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
    return response.data;
  }

  putFormData({required String endPoint, required body}) async {
    Response response = await _dio.put(
      '$baseUrl/$endPoint',
      data: body,
      options: Options(headers: {
        "Authorization": "Bearer  ",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }),
    );
    return response.data;
  }

  delete({required String endPoint}) async {
    Response response = await _dio.delete('$baseUrl/$endPoint',
        options: Options(headers: {
          "Authorization": "Bearer  ",
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));

    return response.data;
  }
}

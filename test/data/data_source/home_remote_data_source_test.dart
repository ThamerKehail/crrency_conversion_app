// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter_app/core/utils/api_service/api_service.dart';
import 'package:currency_converter_app/features/home/data/data_source/remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_json_response_test.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('HomeRemoteDataSourceImp', () {});
  group("should return CurrencyModel", () {
    test('when Client response was 200 and has valid data', () async {
      MockClient mockClient = MockClient(
        (request) async {
          return http.Response(request.body, 200);
        },
      );
      mockClient = MockClient(
        (request) async {
          final HomeRemoteDataSourceImp homeRemoteDataSourceImpUnderTest =
              HomeRemoteDataSourceImp(ApiService(Dio()), client: mockClient);
          final responseBody = homePageResponse;

          when(mockClient.get(
            Uri.parse(
                "https://api.fastforex.io/currencies?api_key=f3b5f05a3e-b485ad8d61-s8y70m"),
            headers: {
              'content-type': 'application/json ',
            },
          )).thenAnswer((realInvocation) =>
              Future.value(http.Response(responseBody, 200)));

          final result = await homeRemoteDataSourceImpUnderTest.fetchCountry();
          expect(
            result,
            homePageResponse,
          );

          return http.Response(responseBody, 200);
        },
      );
    });
  });
}

import 'package:currency_converter_app/features/home/data/data_source/local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/home/data/data_source/remote_data_source.dart';
import '../../features/home/data/repo/home_repository_imp.dart';
import '../../features/home/domain/use_cases/home_use_case.dart';
import '../utils/api_service/api_service.dart';

final GetIt getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerFactory(() => http.Client());
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<FetchHomeUseCase>(
    FetchHomeUseCase(
      HomeRepositoryImp(HomeRemoteDataSourceImp(getIt.get<ApiService>()),
          HomeLocalDataSourceImp()),
    ),
  );
}

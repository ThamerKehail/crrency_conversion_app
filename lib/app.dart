import 'package:currency_converter_app/features/home/presentation/home_screen.dart';
import 'package:currency_converter_app/features/home/presentation/manager/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/functions/setup_service_locator.dart';
import 'core/utils/theme/theme.dart';
import 'features/home/domain/use_cases/home_use_case.dart';
import 'features/home/presentation/manager/convert_cubit.dart';
import 'features/home/presentation/manager/hiatorical_date_cubit.dart';
import 'features/home/presentation/manager/historical_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CountryCubit(getIt.get<FetchHomeUseCase>())),
        BlocProvider(
            create: (_) => ConvertCubit(getIt.get<FetchHomeUseCase>())),
        BlocProvider(
            create: (_) => HistoricalCubit(getIt.get<FetchHomeUseCase>())),
        BlocProvider(create: (_) => HiatoricalDateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: CustomAppTheme.theme,
        home: const HomeScreen(),
      ),
    );
  }
}

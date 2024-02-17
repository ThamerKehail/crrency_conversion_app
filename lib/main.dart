import 'package:currency_converter_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/functions/setup_service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'features/home/domain/entities/country.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();

  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyEntityAdapter());
  await Hive.openBox<CurrencyEntity>("currency");

  runApp(const App());
}

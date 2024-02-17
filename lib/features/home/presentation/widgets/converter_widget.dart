import 'package:currency_converter_app/features/home/presentation/manager/convert_cubit.dart';
import 'package:currency_converter_app/features/home/presentation/manager/hiatorical_date_cubit.dart';
import 'package:currency_converter_app/features/home/presentation/manager/historical_cubit.dart';
import 'package:currency_converter_app/features/home/presentation/widgets/trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/country_cubit.dart';
import 'convert_card.dart';

class ConverterWidget extends StatefulWidget {
  const ConverterWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  @override
  void initState() {
    context.read<CountryCubit>().fetchCountry();
    context.read<HistoricalCubit>().fetchHistorical(
        date: context.read<HiatoricalDateCubit>().currentDate,
        from: context.read<ConvertCubit>().fromCurrency,
        to: context.read<ConvertCubit>().toCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return const Column(
      children: [
        ConvertCard(),
        SizedBox(height: 30),
        TrendingWidget(),
      ],
    );
  }
}

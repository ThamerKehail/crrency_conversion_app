import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/convert_cubit.dart';
import '../manager/country_cubit.dart';
import '../manager/hiatorical_date_cubit.dart';
import '../manager/historical_cubit.dart';
import 'amount_input.dart';
import 'convert_view.dart';
import 'currency_input.dart';

class ConvertCard extends StatelessWidget {
  const ConvertCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AmountInput(),
                  const SizedBox(height: 16),
                  BlocBuilder<CountryCubit, CountryState>(
                    builder: (context, state) {
                      if (state is CountryFetchSuccessState) {
                        return CurrencyInput(
                          value: context.read<ConvertCubit>().fromCurrency,
                          onChanged: (value) {
                            context.read<ConvertCubit>().fromCurrency =
                                value.toString();
                          },
                          countries: state.countries,
                        );
                      } else if (state is CountryFetchLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CountryCubit, CountryState>(
                    builder: (context, state) {
                      if (state is CountryFetchSuccessState) {
                        return CurrencyInput(
                          value: context.read<ConvertCubit>().toCurrency,
                          onChanged: (value) {
                            context.read<ConvertCubit>().toCurrency =
                                value.toString();
                          },
                          countries: state.countries,
                        );
                      } else if (state is CountryFetchLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocListener<ConvertCubit, ConvertState>(
                    listener: (context, state) {
                      if (state is ConvertSuccessState) {
                        context.read<HistoricalCubit>().fetchHistorical(
                            date:
                                context.read<HiatoricalDateCubit>().currentDate,
                            from: context.read<ConvertCubit>().fromCurrency,
                            to: context.read<ConvertCubit>().toCurrency);
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        print(context
                            .read<ConvertCubit>()
                            .textEditingController
                            .text);
                        print(context.read<ConvertCubit>().fromCurrency);
                        print(context.read<ConvertCubit>().toCurrency);
                        context.read<ConvertCubit>().convertCurrency();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: const Center(
                          child: Text('Convert'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const ConvertView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/convert_cubit.dart';

class ConvertView extends StatelessWidget {
  const ConvertView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    ConvertCubit cubit = context.read<ConvertCubit>();

    return BlocBuilder<ConvertCubit, ConvertState>(
      builder: (context, state) {
        if (state is ConvertSuccessState) {
          double amount = double.parse(cubit.textEditingController.text);
          double rate = state.convertModel.result?.rate?.toDouble() ?? 0.0;
          double total = amount / rate;
          return Card(
            color: Colors.white,
            elevation: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '${cubit.textEditingController.text} ${cubit.fromCurrency} equals',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.network(
                        "https://flagcdn.com/28x21/${cubit.fromCurrency.toLowerCase().substring(0, 2)}.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${state.convertModel.result?.type?.toDouble() ?? 0.0} ${cubit.toCurrency}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      '${cubit.textEditingController.text} ${cubit.toCurrency} equals',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.network(
                        "https://flagcdn.com/28x21/${cubit.toCurrency.toLowerCase().substring(0, 2)}.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${total.toStringAsFixed(2)} ${cubit.fromCurrency}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        } else if (state is ConvertLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

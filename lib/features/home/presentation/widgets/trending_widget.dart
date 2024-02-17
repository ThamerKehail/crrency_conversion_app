import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter_app/features/home/presentation/manager/historical_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/convert_cubit.dart';
import '../manager/hiatorical_date_cubit.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> last7Days =
        context.read<HiatoricalDateCubit>().getLast7Days(DateTime.now());
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Currencies',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlocBuilder<HiatoricalDateCubit, HiatoricalDateState>(
            builder: (context, state) {
              return SizedBox(
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: last7Days.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          context
                              .read<HiatoricalDateCubit>()
                              .changeCurrentDate(last7Days[index].toString());
                          await context.read<HistoricalCubit>().fetchHistorical(
                              date: context
                                  .read<HiatoricalDateCubit>()
                                  .currentDate,
                              from: context.read<ConvertCubit>().fromCurrency,
                              to: context.read<ConvertCubit>().toCurrency);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 2,
                            color: context
                                        .read<HiatoricalDateCubit>()
                                        .currentDate ==
                                    last7Days[index].toString()
                                ? Colors.grey
                                : Colors.transparent,
                          )),
                          child: Center(
                            child: Text(last7Days[index].toString()),
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
          BlocBuilder<HistoricalCubit, HistoricalState>(
            builder: (context, state) {
              if (state is HistoricalSuccessState) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: 5,
                    columns: [
                      DataColumn(
                        label: Container(
                          child: Row(
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minHeight: 20,
                                  minWidth: 20,
                                  maxHeight: 20,
                                  maxWidth: 20,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://flagcdn.com/28x21/${context.read<ConvertCubit>().fromCurrency.toLowerCase().substring(0, 2)}.png",
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                context.read<ConvertCubit>().fromCurrency,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Text(
                          'Last Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                    rows: state.historical.map((d) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: [
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minHeight: 20,
                                      minWidth: 20,
                                      maxHeight: 20,
                                      maxWidth: 20,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://flagcdn.com/28x21/${d.currencyCode.toLowerCase().substring(0, 2)}.png",
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${d.currencyCode}/USD',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${d.rate}',
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              } else if (state is HistoricalFailureState) {
                return Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Center(
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              } else if (state is HistoricalLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

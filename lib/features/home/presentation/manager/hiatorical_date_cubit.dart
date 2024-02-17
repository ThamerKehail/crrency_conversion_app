import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'hiatorical_date_state.dart';

class HiatoricalDateCubit extends Cubit<HiatoricalDateState> {
  HiatoricalDateCubit() : super(HiatoricalDateInitial());
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  changeCurrentDate(String date) {
    currentDate = date;

    emit(HiatoricalDateChangeState());
  }

  List<String> getLast7Days(DateTime currentDate) {
    List<String> last7Days = [];
    for (int i = 6; i >= 0; i--) {
      DateTime date = currentDate.subtract(Duration(days: i));
      print(formatDate(date));

      last7Days.add(formatDate(date));
    }
    return last7Days;
  }
}

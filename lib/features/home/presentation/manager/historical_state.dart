part of 'historical_cubit.dart';

@immutable
abstract class HistoricalState {}

class HistoricalInitial extends HistoricalState {}

class HistoricalLoadingState extends HistoricalState {}

class HistoricalFailureState extends HistoricalState {
  final String message;

  HistoricalFailureState(this.message);
}

class HistoricalSuccessState extends HistoricalState {
  final List<HistoricalModel> historical;

  HistoricalSuccessState(this.historical);
}

part of 'convert_cubit.dart';

@immutable
abstract class ConvertState {}

class ConvertInitial extends ConvertState {}

class ConvertLoadingState extends ConvertState {}

class ConvertFailureState extends ConvertState {
  final String message;

  ConvertFailureState(this.message);
}

class ConvertSuccessState extends ConvertState {
  final ConvertModel convertModel;

  ConvertSuccessState(this.convertModel);
}

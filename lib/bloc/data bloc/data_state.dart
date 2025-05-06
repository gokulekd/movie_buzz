import 'package:equatable/equatable.dart';
import 'package:movie_buzz/model/main_data_model.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object?> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final MainDataModel data;

  const DataLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class DataError extends DataState {
  final String message;

  const DataError(this.message);

  @override
  List<Object?> get props => [message];
}

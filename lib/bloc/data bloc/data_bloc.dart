import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/repository/data_repository.dart';

import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository repository;

  DataBloc(this.repository) : super(DataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await repository.fetchData();
        emit(DataLoaded(data!));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
  }
}

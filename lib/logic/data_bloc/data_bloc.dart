import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/core/network/api_client.dart';

import 'data_event.dart';
import 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final ApiClient apiClient;

  DataBloc(this.apiClient) : super(DataInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await apiClient.fetchData();
        emit(DataLoaded(data!));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
  }
}

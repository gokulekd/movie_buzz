import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/connectivity%20bloc/connectivity_event.dart';
import 'package:movie_buzz/bloc/connectivity%20bloc/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _subscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<CheckConnectivityEvent>(_onCheck);
    on<ConnectivityChangedEvent>(_onChanged);

    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      // ignore: unrelated_type_equality_checks
      add(ConnectivityChangedEvent(result != ConnectivityResult.none));
    });

    add(CheckConnectivityEvent());
  }

  Future<void> _onCheck(CheckConnectivityEvent event, Emitter emit) async {
    final result = await _connectivity.checkConnectivity();
    // ignore: unrelated_type_equality_checks
    emit(
      result != ConnectivityResult.none
          ? ConnectivityOnline()
          : ConnectivityOffline(),
    );
  }

  void _onChanged(ConnectivityChangedEvent event, Emitter emit) {
    emit(event.isConnected ? ConnectivityOnline() : ConnectivityOffline());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/logic/navigation_bloc/navigation_event.dart';
import 'package:movie_buzz/logic/navigation_bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(0)) {
    on<NavigateToTab>((event, emit) {
      emit(NavigationState(event.index));
    });
  }
}

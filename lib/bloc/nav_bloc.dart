import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/bloc/nav_event.dart';

class NavBloc extends Bloc<NavEvent, int> {
  NavBloc() : super(0) {
    on<NavItemSelected>((event, emit) => emit(event.index));
  }
}

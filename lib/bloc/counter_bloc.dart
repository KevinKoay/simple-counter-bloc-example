import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
//  static const int _counter = 0;

//  CounterBloc() : super(CounterInitial(_counter));
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increment) {
      yield state + 1;
    } else if (event is Decrement) {
      yield state - 1;
    }
  }
}

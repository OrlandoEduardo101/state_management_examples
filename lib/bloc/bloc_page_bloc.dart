import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/counter_state/counter_state.dart';
import 'bloc_event.dart';

class BlocPageBloc extends Bloc<IBlocEvent, ICounterState> {
  BlocPageBloc() : super(CounterState()) {
    on<IncrementBlocEvent>((event, emit) => increment(event, emit));
  }

  Future<void> increment(IBlocEvent event, Emitter<ICounterState> emit) async {
    emit(CounterLoading());
    await Future.delayed(const Duration(milliseconds: 500));

    emit(CounterState(value: event.value + 1));
    
    if ((state as CounterState).value == 5) {
      emit(CounterError(value: (state as CounterState).value));
    }

  }
}

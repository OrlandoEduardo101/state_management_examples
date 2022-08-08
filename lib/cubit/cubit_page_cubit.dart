import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_examples/counter_state/counter_state.dart';

class CubitPageCubit extends Cubit<ICounterState> {
  CubitPageCubit() : super(CounterState());

  Future<void> increment(int value) async {
    emit(CounterLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(CounterState(value: value + 1));

    if ((state as CounterState).value == 5) {
      emit(CounterError('count == 5',value: (state as CounterState).value));
    }
  }
}

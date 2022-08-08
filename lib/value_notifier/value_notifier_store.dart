import 'package:flutter/material.dart' hide Action, State;
import 'package:state_management_examples/counter_state/counter_state.dart';

class ValueNotifierStore extends ValueNotifier<ICounterState> {
  ValueNotifierStore() : super(CounterState(value: 0));

  Future<void> increment() async {
    final localCount = value;
    value = CounterLoading();

    if (localCount is CounterState) {
      await Future.delayed(const Duration(milliseconds: 500));
      value = CounterState(value: localCount.value + 1);

      if ((value as CounterState).value == 5) {
        value = CounterError('count == 5', value: localCount.value);
      }
    }

    if (localCount is CounterError) {
      await Future.delayed(const Duration(milliseconds: 500));
      value = CounterState(value: localCount.value + 2);
    }
  }
}

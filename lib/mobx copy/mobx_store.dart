import 'package:mobx/mobx.dart';

import '../counter_state/counter_state.dart';

class MobxStore {
  MobxStore() {
    increment = Action(_increment);
  }

  final _state = Observable(CounterState());
  CounterState get state => _state.value;

  set state(CounterState newValue) => _state.value = newValue;
  late Action increment;

  void _increment() {
    state = CounterState(value: state.value + 1);
  }
}

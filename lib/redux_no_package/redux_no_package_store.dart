import '../counter_state/counter_state.dart';
import 'store.dart';

enum AppAction { increment, decrement }

CounterState _reducer(CounterState state, dynamic action) {
  if (action == AppAction.increment) {
    return CounterState(value: state.value + 1);
  } else {
    return state;
  }
}

final reduxStore =
    Store<AppAction, CounterState>(initialState: CounterState(), reducer: _reducer);
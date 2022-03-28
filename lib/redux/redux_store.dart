import 'package:redux/src/store.dart';
import '../counter_state/counter_state.dart';


enum AppAction { increment, decrement }

CounterState _reducer(CounterState state, dynamic action) {
  if (action == AppAction.increment) {
    return CounterState(value: state.value + 1);
    // return state + 1;
  } else {
    return state;
    // return state - 1;
  }
}

final reduxStore = Store<CounterState>(_reducer, initialState: CounterState());
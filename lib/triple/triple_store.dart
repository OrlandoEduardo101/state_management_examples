import 'package:flutter_triple/flutter_triple.dart';
import 'package:state_management_examples/counter_state/counter_state.dart';

class TriplePageStore extends StreamStore<CounterError, CounterState> {
  TriplePageStore() : super(CounterState());

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(milliseconds: 500));

    update(CounterState(value: state.value + 1));

    if (state.value == 5) {
      setError(CounterError(value: state.value));
    }
    setLoading(false);
  }
}

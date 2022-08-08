abstract class ICounterState {}

class CounterState implements ICounterState {
  final int value;

  CounterState({this.value = 0});

  operator +(int _value) {
    return CounterState(value: value + _value);
  }

  operator -(int _value) {
    return CounterState(value: value + _value);
  }

  @override
  String toString() {
    return '$value';
  }
}

class CounterLoading implements ICounterState {}

class CounterError implements ICounterState {
  final int value;
  final String message;

  CounterError(this.message, {this.value = 0});
}

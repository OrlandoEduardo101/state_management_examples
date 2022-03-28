abstract class IBlocEvent {
  final int value;

  IBlocEvent(this.value);
}

class IncrementBlocEvent extends IBlocEvent {
  IncrementBlocEvent(int value) : super(value);
}

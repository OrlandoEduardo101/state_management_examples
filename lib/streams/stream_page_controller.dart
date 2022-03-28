import 'dart:async';

class StreamPageController {
  int _counter = 0;
  late StreamController streamController;
  late Stream stream;
  StreamPageController() {
    streamController = StreamController();
    stream = streamController.stream;
  }

  void incrementCounter() {
  streamController.sink.add(_counter++);
  }

}

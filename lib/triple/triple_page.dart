import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../counter_state/counter_state.dart';
import 'triple_store.dart';

class TriplePage extends StatefulWidget {
  const TriplePage({Key? key, this.title = 'Segmented State Pattern (Triple) Page'})
      : super(key: key);

  final String title;

  @override
  _TriplePageState createState() => _TriplePageState();
}

class _TriplePageState extends State<TriplePage> {
  final controller = TriplePageStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ScopedBuilder<TriplePageStore, CounterError, CounterState>(
              store: controller,
              onLoading: (context) => const Center(child: CircularProgressIndicator(),),
              onError: (context, state) => const Center(
                child: Text(
                  'error',
                ),
              ),
              onState: (context, state) => Center(
                child: Text(
                  state.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

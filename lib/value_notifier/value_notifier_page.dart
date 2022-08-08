import 'package:flutter/material.dart';
import 'package:state_management_examples/counter_state/counter_state.dart';
import 'value_notifier_store.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({Key? key, this.title = 'ValueNotifier Page'}) : super(key: key);

  final String title;

  @override
  _ValueNotifierPageState createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  final controller = ValueNotifierStore();

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
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, state, child) {
                if (state is CounterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CounterError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return Text(
                  '${(state as CounterState).value}',
                );
              },
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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

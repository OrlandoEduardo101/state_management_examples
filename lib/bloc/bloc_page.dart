import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_state/counter_state.dart';
import 'bloc_event.dart';
import 'bloc_page_bloc.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key, this.title = 'BLoC Page'}) : super(key: key);

  final String title;

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final controller = BlocPageBloc();

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
            BlocBuilder<BlocPageBloc, ICounterState>(
                bloc: controller,
                builder: (context, state) {
                  if (state is CounterLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is CounterError) {
                    return const Text(
                      'error',
                    );
                  }

                  return Text(
                    (state as CounterState).toString(),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.state is CounterState) {
            controller.add(IncrementBlocEvent((controller.state as CounterState).value));
          } else if(controller.state is CounterError){
            controller.add(IncrementBlocEvent((controller.state as CounterError).value));
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }
}

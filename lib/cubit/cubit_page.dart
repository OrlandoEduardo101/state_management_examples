import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_state/counter_state.dart';
import 'cubit_page_cubit.dart';

class CubitPage extends StatefulWidget {
  const CubitPage({Key? key, this.title = 'Cubit Page'}) : super(key: key);

  final String title;

  @override
  _CubitPageState createState() => _CubitPageState();
}

class _CubitPageState extends State<CubitPage> {
  final controller = CubitPageCubit();

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
            BlocBuilder<CubitPageCubit, ICounterState>(
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
            controller.increment((controller.state as CounterState).value);
          } else if(controller.state is CounterError){
            controller.increment((controller.state as CounterError).value);
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
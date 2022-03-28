import 'package:flutter/material.dart' hide Action;
import 'package:flutter/material.dart';

import 'redux_no_package_store.dart';

class ReduxNoPackagePage extends StatefulWidget {
  const ReduxNoPackagePage({Key? key, this.title = 'Redux Pattern no Package'}) : super(key: key);

  final String title;

  @override
  _ReduxNoPackagePageState createState() => _ReduxNoPackagePageState();
}

class _ReduxNoPackagePageState extends State<ReduxNoPackagePage> {
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
            AnimatedBuilder(
              animation: reduxStore,
              builder: (_, __) {
                return Text(
                  //'${reduxStore.state.value}',
                  reduxStore.state.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          reduxStore.dispatcher(AppAction.increment);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

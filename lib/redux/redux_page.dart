import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import '../counter_state/counter_state.dart';
import 'redux_store.dart';
import 'package:flutter/material.dart';

class ReduxPage extends StatefulWidget {
  const ReduxPage({Key? key, this.title = 'Redux Pattern'}) : super(key: key);

  final String title;

  @override
  _ReduxPageState createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: reduxStore,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StoreConnector<CounterState, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) {
                      return Text(
                        'The button has been pushed this many times: $count',
                      );
                    },
                  )
            ],
          ),
        ),
    
        floatingActionButton:  StoreConnector<CounterState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(AppAction.increment);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                );
              },
            ),
      ),
    );
  }
}
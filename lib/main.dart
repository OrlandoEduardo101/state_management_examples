import 'package:flutter/material.dart';
import 'package:state_management_examples/triple/triple_page.dart';

import 'bloc/bloc_page.dart';
import 'change_notifier/change_notifier_page.dart';
import 'cubit/cubit_page.dart';
import 'mobx/mobx_page.dart';
import 'redux/redux_page.dart';
import 'redux_no_package/redux_no_package_page.dart';
import 'set_state/set_state_page.dart';
import 'streams/stream_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter State Management Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter State Management Demo'),
          ),
          body: const Center(
            child:  MenuList(),
          ),
        ));
  }
}



class MenuList extends StatelessWidget {
  const MenuList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SetStatePage()),
                      );
                    },
                    child: const Text('SetState Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ChangeNotifierPage()),
                      );
                    },
                    child: const Text('ChangeNotifier Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ReduxPage()),
                      );
                    },
                    child: const Text('Redux Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ReduxNoPackagePage()),
                      );
                    },
                    child: const Text('Redux No Package Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const StreamPage()),
                      );
                    },
                    child: const Text('Stream Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const BlocPage()),
                      );
                    },
                    child: const Text('BLoC Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CubitPage()),
                      );
                    },
                    child: const Text('Cubit Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MobxPage()),
                      );
                    },
                    child: const Text('MobX Page'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const TriplePage()),
                      );
                    },
                    child: const Text('Segmented State Pattern (Triple) Page'),
                  ),
                )
              ],
            );
  }
}
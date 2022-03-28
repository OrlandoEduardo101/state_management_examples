import 'package:flutter/material.dart';
import 'mobx_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({Key? key, this.title = 'MobX Page'})
      : super(key: key);

  final String title;

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  final controller = MobxStore();

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
            Observer(
              builder: (context) => Text(
                '${controller.state.value}',
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenLifecyle extends StatefulWidget {
  final String title;

  const ScreenLifecyle({Key? key, this.title = 'LifeCycle Page'}) : super(key: key);

  //createState(): When the Framework is instructed to build a StatefulWidget, it immediately calls createState()
  @override
  State<StatefulWidget> createState() {
    return ScreenLifecyleState();
  }
}

class ScreenLifecyleState extends State<ScreenLifecyle> with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;
  /*
    mounted is true: When createState creates your state class, a buildContext is assigned to that state.
    BuildContext is, overly simplified, the place in the widget tree in which this widget is placed.
    Here's a longer explanation. All widgets have a bool this.mounted property.
    It is turned true when the buildContext is assigned. It is an error to call setState when a widget is unmounted.
    mounted is false: The state object can never remount, and an error is thrown is setState is called.
    */

  /*
    This is the first method called when the widget is created (after the class constructor, of course.)
    initState is called once and only once. It must called super.initState().
    */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("initState");
    WidgetsBinding.instance.addObserver(this);
  }

  /*
    This method is called immediately after initState on the first time the widget is built.
    */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    log("didChangeDependencies");
  }

  /*
    build(): This method is called often. It is required, and it must return a Widget.
    */
  @override
  Widget build(BuildContext context) {
    log("build");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(builder: (context) {
        if (_lastLifecycleState == null) {
          return const Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Text('This widget has not observed any lifecycle changes.', textAlign: TextAlign.center,),
            ),
          );
        }
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Text('The most recent lifecycle state this widget observed was: $_lastLifecycleState.', textAlign: TextAlign.center,),
          ),
        );
      }),
    );
  }

  /*
    If the parent widget changes and has to rebuild this widget (because it needs to give it different data),
    but it's being rebuilt with the same runtimeType, then this method is called.
    This is because Flutter is re-using the state, which is long lived.
    In this case, you may want to initialize some data again, as you would in initState.
    */
  @override
  void didUpdateWidget(ScreenLifecyle oldWidget) {
    log("didUpdateWidget");

    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(fn) {
    log("setState");

    // TODO: implement setState
    super.setState(fn);
  }

  /*
    Deactivate is called when State is removed from the tree,
    but it might be reinserted before the current frame change is finished.
    This method exists basically because State objects can be moved from one point in a tree to another.
    */
  @override
  void deactivate() {
    // TODO: implement deactivate
    log("deactivate");
    super.deactivate();
  }

  /*
    Dispose is called when the State object is removed, which is permanent.
    This method is where you should unsubscribe and cancel all animations, streams, etc.
    */
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    log("dispose");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    setState(() {
      _lastLifecycleState = state;
    });

    switch (state) {
      case AppLifecycleState.inactive:
        log('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        log('appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        log('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        log('appLifeCycleState detached');
        break;
    }
  }
}

import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key});

  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
  bool _inForGround = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text(_inForGround ? 'ForGround App' : 'Background App')));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          _inForGround = true;
        });
        debugPrint('Running in foreground (active) ---> Resumed');

      case AppLifecycleState.inactive:
        setState(() {
          _inForGround = true;
        });
        debugPrint('Running in foreground (inActive) ---> inactive');

      case AppLifecycleState.hidden:
      // TODO: Handle this case.
      case AppLifecycleState.paused:
        setState(() {
          _inForGround = false;
        });
        debugPrint('Running in background ---> paused');

      case AppLifecycleState.detached:
        setState(() {
          _inForGround = false;
        });
        debugPrint('Detached ---> detached');
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}

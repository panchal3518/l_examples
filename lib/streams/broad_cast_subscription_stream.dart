import 'dart:async';

import 'package:flutter/cupertino.dart';

void main() {
  // Create a broadcast stream controller
  final controller = StreamController<int>.broadcast();

  // Subscribe to the stream with multiple listeners
  final subscription1 = controller.stream.listen((data) {
    debugPrint('Listener 1: $data');
  });

  final subscription2 = controller.stream.listen((data) {
    debugPrint('Listener 2: $data');
  });

  // Add data to the stream
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);

  Future.delayed(const Duration(seconds: 1), () {
    // Close the stream when done
    controller.close();

    // Cancel subscriptions when no longer needed
    subscription1.cancel();
    subscription2.cancel();
  });
}

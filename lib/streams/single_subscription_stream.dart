import 'dart:async';

import 'package:flutter/cupertino.dart';

void main() {
  singleSubscription1();
  //singleSubscription2();
}

singleSubscription1() {
  final Stream<int> originalStream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  // //Transform the original stream using map()
  final Stream<int> transformedStream = originalStream.map((event) {
    return event * 2;
  });

  //Listen to transformed stream
  final StreamSubscription<int> subscription =
      transformedStream.listen((value) {
    debugPrint('Transformed value: $value');
  });

  //Close the subscription
  Future.delayed(const Duration(seconds: 1), () {
    subscription.cancel();
  });
}

singleSubscription2() {
  //Create stream
  Stream<int> stream = countStream(6);
  stream.listen(
    (value) {
      debugPrint('Received: $value');
    },
    onDone: () {
      debugPrint('Stream is done');
    },
  );
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    //Yield each value asynchronously
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

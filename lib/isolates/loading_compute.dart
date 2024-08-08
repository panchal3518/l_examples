import 'dart:async';
import 'package:flutter/foundation.dart';
import 'isolate_main_thread.dart';

void main() async {
  await loadDataFromCompute();
}

Future<void> loadDataFromCompute() async {
  List<Map<String, dynamic>> result = [];

  for (int i = 0; i < 10; i++) {
    debugPrint('index :: $i');
    result.add(await compute(fetchData, 5));
  }
}


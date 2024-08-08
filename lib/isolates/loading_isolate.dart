import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'isolate_main_thread.dart';

void main() async {
  await loadDataFromIsolate();
}

Future<void> loadDataFromIsolate() async {
  List<Map<String, dynamic>> result = [];
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(fetchDataIsolate, receivePort.sendPort);

  await for (var response in receivePort) {
    if (response == null) {
      break;
    }
    if (response is Map<String, dynamic>) {
      result.add(response);
    }
  }
  debugPrint('Isolate execution completed ${result.length}');
}

fetchDataIsolate(SendPort sendPort) async {
  for (int i = 0; i < 10; i++) {
    sendPort.send(await fetchData(5));
  }
  sendPort.send(null);
}

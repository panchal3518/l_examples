import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  await loadDataFromMainThread();
}

loadDataFromMainThread() async {
  List<Map<String, dynamic>> result = [];
  for (int i = 0; i < 10; i++) {
    result.add(await fetchData(5));
  }
}

Future<Map<String, dynamic>> fetchData(int reqCount) async {
  final url = Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
  List<Future<http.Response>> futures = [];
  for (int j = 0; j < reqCount; j++) {
    debugPrint('j :: $j');
    futures.add(http.get(url));
  }

  try {
    final responses = await Future.wait(futures);
    for (int i = 0; i < responses.length; i++) {
      var response = responses[i];
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        debugPrint('Request success with status $i');
        return jsonData;
      } else {
        debugPrint(
            'Request failed with status: ${response.statusCode} :: ${responses.indexOf(response)}');
      }
    }
  } catch (e) {
    debugPrint('An error occurred: $e');
  }

  return {};
}

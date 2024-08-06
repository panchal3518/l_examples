import 'package:flutter/material.dart';

class FilterFunc extends StatefulWidget {
  const FilterFunc({super.key});

  @override
  State<FilterFunc> createState() => _FilterFuncState();
}

class _FilterFuncState extends State<FilterFunc> {
  final _arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Array --> $_arr',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Where --> ',
                  style: Theme.of(context).textTheme.titleSmall,
                  children: <TextSpan>[
                    const TextSpan(
                        text:
                            '_arr.where((element) => element % 2 == 0).toList()',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${whereFunc()}',
                        style: const TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  whereFunc() {
    final result = _arr.where((element) => element % 2 == 0).toList();
    return result;
  }
}

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
          title: const Text('Filter : where, map, reduce'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Array --> $_arr',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                bindFilterWidget(
                    title: 'Where',
                    description:
                        'Dart list supports an equivalent to the filter function, the where method. It takes a predicate function and returns a new Iterable (.toList can be used to return a list instance). It is declarative and tells exactly what the code does.',
                    label1:
                        '_arr.where((element) => element % 2 == 0).toList()',
                    label2: '${whereFunc()}'),
                const SizedBox(height: 20),
                bindFilterWidget(
                    title: 'Map',
                    description:
                        'The map works the same way as a filter, except that instead of taking a predicate function, it takes a mapper function, applies it to each element from the list, and returns a new list.',
                    label1: '_arr.map((element) => element * 2).toList()',
                    label2: '${mapFunc()}'),
                const SizedBox(height: 20),
                bindFilterWidget(
                    title: 'Reduce',
                    description:
                        'Reduce takes in an initial value, a reducer function, and returns the accumulated value. The reducer function is a two-argument function that takes (1) an element from the list and (2) an accumulator, which is the result of the previous reduction. This reducer function is applied to every element of the list.',
                    label1: '_arr.reduce((value, element) => value + element)',
                    label2: '${reduceFunc()}'),
                const SizedBox(height: 20),
                bindFilterWidget(
                    title: 'Fold',
                    description:
                        'The fold method works the same as the reduce method, but it lets us pass the initial value.',
                    label1:
                        '_arr.fold(10, (value, element) => value + element)',
                    label2: '${foldFunc()}'),
              ],
            ),
          ),
        ));
  }

  whereFunc() {
    final result = _arr.where((element) => element % 2 == 0).toList();
    return result;
  }

  mapFunc() {
    //Imperative approach
    // final _result = <int>[];
    // for (final element in _arr) {
    //   _result.add(element * 2);
    // }
    // debugPrint(_result.toString());

    //Declarative approach: map
    final result = _arr.map((element) => element * 2).toList();
    return result;
  }

  reduceFunc() {
    //Imperative approach
    // int _sum = 0;
    // for (final item in _arr) {
    //   _sum += item;
    // }
    //
    // return _sum;

    //Declarative
    final _result = _arr.reduce((value, element) => value + element);
    return _result;
  }

  foldFunc() {
    //Declarative
    final _result = _arr.fold(10, (value, element) => value + element);
    return _result;
  }

  flatMapFunc() {}

  Widget bindFilterWidget(
      {required String description,
      required String title,
      required String label1,
      required String label2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(description),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: label1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(
                  text: '\n \n Output: $label2',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}

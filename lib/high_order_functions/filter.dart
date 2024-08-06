import 'package:flutter/material.dart';

class FilterFunc extends StatefulWidget {
  const FilterFunc({super.key});

  @override
  State<FilterFunc> createState() => _FilterFuncState();
}

class _FilterFuncState extends State<FilterFunc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
        ),
        body: Text(''));
  }
}

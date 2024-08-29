import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:l_examples/routes/app_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    children.add(bindNewItem(title: 'Filter', routeName: AppRouter.filter));
    children.add(bindNewItem(
        title: 'Widget Binding Observer', routeName: AppRouter.lifeCycle));

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: kIsWeb ? 0 : 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Flutter: Higher Order Functions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: children,
            )),
            const SizedBox(height: 20)
          ],
        ),
      )),
    );
  }

  Widget bindNewItem({required String title, required String routeName}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ElevatedButton(
        child: Text(title),
        onPressed: () {
          context.goNamed(routeName);
        },
      ),
    );
  }
}

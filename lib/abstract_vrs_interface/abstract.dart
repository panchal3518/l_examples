import 'package:flutter/foundation.dart';

void main() {
  Demo1().test();
  Demo2().test();

  AbsImpl absImpl = AbsImpl();
  absImpl.test();
}

abstract class Abs1 {
  test() {
    debugPrint('Abs 1 executed');
  }
}

abstract class Abs2 {
  test() {
    debugPrint('Abs 2 executed');
  }
}

class AbsImpl extends Abs1 {
  @override
  test() {
    // TODO: implement test
    debugPrint('AbsImpl executed');
    return super.test();
  }
}

mixin DemoMixin1 {
  test() {
    // TODO: implement test1
    debugPrint('Test 1 executed in DemoImpl 1...');
  }
}

mixin DemoMixin2 {
  test() {
    // TODO: implement test1
    debugPrint('Test 2 executed in DemoImpl 2...');
  }
}

class Demo1 with DemoMixin1 {}

class Demo2 with DemoMixin2 {}


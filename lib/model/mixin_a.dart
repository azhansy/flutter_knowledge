class A {
  String showMessage() => 'showMessage A';
}

class B {
  String showMessage() => 'showMessage B';
}

class P {
  String showMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

int mul(int a, int b) => a * b;

String tag(String text, {String open = "<", String close = ">"}) =>
    "$open$text$close";

String mark(String name, [int? score]) {
  return score == null ? "$name: -" : "$name: $score";
}

int Function(int) adder(int n) => (int x) => x + n;

void run(void Function() task) {
  print("เริ่ม");
  task();
  print("จบ");
}

void main() {
  print("--- 1 ---");
  print(mul(3, 4));

  print("--- 2 ---");
  print(tag("Dart"));
  print(tag("Dart", open: "[", close: "]"));

  print("--- 3 ---");
  print(mark("A"));
  print(mark("B", 90));

  print("--- 4 ---");
  var list = [1, 2, 3, 4];
  print(list.map((n) => n + 1).where((n) => n % 2 == 0).toList());

  print("--- 5 ---");
  print(adder(10)(5));

  print("--- 6 ---");
  run(() => print("ทำงาน"));
}
void printLine() {
  print("-" * 30);
}

double average(List<int> scores) {
  int total = 0;
  for (int s in scores) {
    total += s;
  }
  return total / scores.length;
}

double gradeOf(int score) {
  if (score >= 80) return 4.0;
  if (score >= 75) return 3.5;
  if (score >= 70) return 3.0;
  if (score >= 65) return 2.5;
  if (score >= 60) return 2.0;
  if (score >= 55) return 1.5;
  if (score >= 50) return 1.0;
  return 0.0;
}

// Part 2
String studentInfo(String name, int age,
    [String school = "วิทยาลัยเทคนิคตราด"]) {
  return "$name อายุ $age ปี ($school)";
}

int calcTotal(int price, {int qty = 1, int discount = 0}) {
  return price * qty - discount;
}

// Part 3
bool isPass(int score) => score >= 50;

// Part 4
List<int> processScores(List<int> scores, int Function(int) f) {
  return scores.map(f).toList();
}

void examResult(int score, void Function(String) onDone) {
  String text = isPass(score) ? "ผ่าน" : "ไม่ผ่าน";
  onDone("คะแนน $score: $text");
}

int countPass(List<int> s) => s.where(isPass).length;

void main() {
  var scores = [45, 80, 62, 95, 30];

  // Part 1
  printLine();
  print("ค่าเฉลี่ย = ${average(scores)}");
  print("เกรดของ 80 = ${gradeOf(80)}");
  printLine();

  // Part 2
  print(studentInfo("สมชาย", 16));
  print(studentInfo("สมหญิง", 17, "วิทยาลัยอาชีวะ"));
  print(calcTotal(250));
  print(calcTotal(250, qty: 3, discount: 50));

  // Part 3
  scores.forEach((s) {
    print("คะแนน $s -> เกรด ${gradeOf(s)}");
  });
  var passed = scores.where((s) => isPass(s)).toList();
  print("ผ่าน: $passed");

  // Part 4
  var curved = processScores(scores, (s) => s + 5);
  print("หลังปรับคะแนน: $curved");
  examResult(62, (msg) {
    print(msg);
  });
  examResult(45, (msg) => print(msg));

    // Part 5
  print("จำนวนที่ผ่าน: ${countPass(scores)}");
  var reduced = processScores(scores, (s) => (s * 0.9).round());
  print("หลังลด 10%: $reduced");
}
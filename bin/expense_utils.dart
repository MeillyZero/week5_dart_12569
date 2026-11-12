// expense_utils.dart

// 1. Positional + Optional
String formatExpense(String item, int amount, [String category = "ทั่วไป"]) {
  return "$item $amount บาท [$category]";
}

// 2. Arrow Syntax
int totalExpense(List<int> amounts) => amounts.fold(0, (a, b) => a + b);

// 3. Named + Anonymous (where)
List<int> filterExpenses(List<int> amounts, {int min = 0, int? max}) {
  return amounts.where((a) => a >= min && (max == null || a <= max)).toList();
}

// 4. Higher-Order (map)
List<int> transform(List<int> amounts, int Function(int) f) {
  return amounts.map(f).toList();
}

// 5. Callback (reduce for the maximum)
void summarize(List<int> amounts, void Function(String) onReport) {
  int highest = amounts.reduce((a, b) => a > b ? a : b);
  onReport(
      "รวม ${amounts.length} รายการ เป็นเงิน ${totalExpense(amounts)} บาท สูงสุด $highest บาท");
}

void main() {
  var amounts = [150, 45, 320, 80, 25, 500];
  print(formatExpense("ข้าวมันไก่", 50));
  print(formatExpense("ค่าเดินทาง", 45, "เดินทาง"));
  print("รวม = ${totalExpense(amounts)}");
  print(filterExpenses(amounts, min: 100));
  print(filterExpenses(amounts, min: 50, max: 200));
  print(transform(amounts, (a) => a - 10));
  summarize(amounts, (report) => print(report));
}

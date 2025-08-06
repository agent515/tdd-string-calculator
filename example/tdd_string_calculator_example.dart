import 'package:tdd_string_calculator/tdd_string_calculator.dart';

void main() {
  final StringCalculator stringCalculator = StringCalculatorImpl();
  print(stringCalculator.add(''));
  print(stringCalculator.add('//|\n23|42|2|12|'));
  print(stringCalculator.add('\n23,32,12'));
  print(stringCalculator.add('//|\n23|-42|2|-12|'));
}

import 'package:tdd_string_calculator/tdd_string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final StringCalculator stringCalculator = StringCalculatorImpl();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(stringCalculator.add(''), 0);
    });
  });
}

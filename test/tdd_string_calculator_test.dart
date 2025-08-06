import 'package:tdd_string_calculator/tdd_string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('String Calculator', () {
    final StringCalculator stringCalculator = StringCalculatorImpl();

    setUp(() {
      // Additional setup goes here.
    });

    test('should return 0 on passing empty string', () {
      expect(stringCalculator.add(''), 0);
    });

    test(
        'should return back the same number when only a single number of one digit is passed',
        () {
      expect(stringCalculator.add('1'), 1);
      expect(stringCalculator.add('5'), 5);
    });
  });
}

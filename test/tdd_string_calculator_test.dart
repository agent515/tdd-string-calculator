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

    test('should throw an Argument Error when just non-number is passed', () {
      expect(() => stringCalculator.add(','), throwsA(isA<ArgumentError>()));
      expect(() => stringCalculator.add('B'), throwsA(isA<ArgumentError>()));
    });

    test(
        'should return back the same number when a single number of multiple digits is passed',
        () {
      expect(stringCalculator.add('1000'), 1000);
      expect(stringCalculator.add('3123'), 3123);
    });

    test('should throw an Argument Error when a negative number is passed', () {
      expect(() => stringCalculator.add('-12'), throwsA(isA<ArgumentError>()));
      expect(() => stringCalculator.add('-3'), throwsA(isA<ArgumentError>()));
    });

    test(
        'should return back the sum of multiple numbers when they are passed as a comma separated string',
        () {
      expect(stringCalculator.add('2,3'), 5);
      expect(stringCalculator.add('0,4'), 4);
      expect(stringCalculator.add('23,4'), 23 + 4);
      expect(stringCalculator.add('23,42,2,12'), 23 + 42 + 2 + 12);
    });
  });
}

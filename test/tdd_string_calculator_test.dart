import 'package:tdd_string_calculator/src/negative_argument_error.dart';
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

    test(
        'should throw an Negative Argument Error when a negative number is passed in a comma separated string',
        () {
      expect(() => stringCalculator.add('2,-3'),
          throwsA(isA<NegativeArgumentError>()));
      expect(() => stringCalculator.add('23,42,-2,12'),
          throwsA(isA<NegativeArgumentError>()));
    });

    test(
        'should return back the sum of multiple numbers when a new-line "\\n" are used interchangeably with commas',
        () {
      expect(stringCalculator.add('2\n3'), 5);
      expect(stringCalculator.add('1\n2,3'), 1 + 2 + 3);
      expect(stringCalculator.add('23,42\n2,12'), 23 + 42 + 2 + 12);
    });

    test(
        'should return back the sum of multiple numbers when there is a trailing delimiter',
        () {
      expect(stringCalculator.add('2\n3,'), 5);
      expect(stringCalculator.add('1\n2,3\n'), 1 + 2 + 3);
      expect(stringCalculator.add('23,42\n2,12\n'), 23 + 42 + 2 + 12);
    });

    test(
        'should return back the sum of multiple numbers when a custom delimiter is used by passing it on the first line',
        () {
      expect(stringCalculator.add('//;\n1;2'), 1 + 2);
      expect(stringCalculator.add('//,\n1,2,3,'), 1 + 2 + 3);
      expect(stringCalculator.add('//|\n23|42|2|12|'), 23 + 42 + 2 + 12);
    });

    test(
        'should throw an Negative Argument Error with all the negative numbers listed when a negative number is passed in a delimitter separated string',
        () {
      expect(
          () => stringCalculator.add('//;\n-11;2'),
          throwsA(
            predicate(
              (e) =>
                  e is NegativeArgumentError &&
                  e.message == 'Negative numbers are not allowed: -11',
            ),
          ));

      expect(
          () => stringCalculator.add('//,\n1,-2,-33,'),
          throwsA(
            predicate(
              (e) =>
                  e is NegativeArgumentError &&
                  e.message == 'Negative numbers are not allowed: -2,-33',
            ),
          ));
      expect(
          () => stringCalculator.add('//|\n23|-42|2|-12|'),
          throwsA(
            predicate(
              (e) =>
                  e is NegativeArgumentError &&
                  e.message == 'Negative numbers are not allowed: -42,-12',
            ),
          ));
    });

    test(
        "should return back the multiplication of the given numbers when a '*' delimiter is used by passing it on the first line",
        () {
      expect(stringCalculator.add('//\*\n1*2'), 1 * 2);
      expect(stringCalculator.add('//\*\n1*2*3'), 1 * 2 * 3);
      expect(stringCalculator.add('//\*\n23*42*2*12'), 23 * 42 * 2 * 12);
    });
  });
}

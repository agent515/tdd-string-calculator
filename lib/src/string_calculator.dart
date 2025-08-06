abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String text) {
    if (text.isEmpty) {
      return 0;
    }

    if (!_isDigit(text)) {
      throw ArgumentError('Invalid input: $text');
    }
    return int.parse(text);
  }

  bool _isDigit(String character) {
    return RegExp(r'^-?\d+$').hasMatch(character);
  }
}

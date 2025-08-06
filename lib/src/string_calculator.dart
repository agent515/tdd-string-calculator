abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String text) {
    if (text.isEmpty) {
      return 0;
    }

    if (!_isNumeric(text)) {
      throw ArgumentError('Invalid input: $text');
    }

    if (_isNegative(text)) {
      throw ArgumentError('Negative numbers are not allowed: $text');
    }
    return int.parse(text);
  }

  bool _isNumeric(String character) {
    return RegExp(r'^-?\d+$').hasMatch(character);
  }

  bool _isNegative(String character) {
    return character.startsWith('-');
  }
}

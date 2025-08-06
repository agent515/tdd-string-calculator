abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String text) {
    if (text.isEmpty) {
      return 0;
    }

    if (text.contains(',')) {
      final numbers = text.split(',');
      return numbers.map(_parseNumber).reduce((a, b) => a + b);
    }

    return _parseNumber(text);
  }

  int _parseNumber(String text) {
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

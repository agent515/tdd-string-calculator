abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String text) {
    String delimiter = ',';
    if (text.startsWith('//')) {
      delimiter = text.substring(2, text.indexOf('\n'));
      text = text.substring(text.indexOf('\n') + 1);
    }
    String formattedText = text.replaceAll('\n', delimiter);

    if (formattedText.contains(delimiter)) {
      final numbers = formattedText.split(delimiter);
      return numbers.map(_parseNumber).reduce((a, b) => a + b);
    }

    return _parseNumber(formattedText);
  }

  int _parseNumber(String text) {
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

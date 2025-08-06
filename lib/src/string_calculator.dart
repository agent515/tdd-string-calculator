abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  @override
  int add(String text) {
    try {
      if (text.isEmpty) {
        return 0;
      }

      if (text.length == 1) {
        if (!_isDigit(text)) {
          throw ArgumentError('Invalid input: $text');
        }
        return int.parse(text);
      }

      return -1;
    } catch (e) {
      throw ArgumentError('Invalid input: $text');
    }
  }

  bool _isDigit(String character) {
    return RegExp(r'^[0-9]$').hasMatch(character);
  }
}

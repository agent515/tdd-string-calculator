abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  int add(String text) {
    if (text.isEmpty) {
      return 0;
    }

    if (text.length == 1) {
      return int.parse(text);
    }

    return -1;
  }
}

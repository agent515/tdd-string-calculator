abstract class StringCalculator {
  int add(String text);
}

class StringCalculatorImpl implements StringCalculator {
  int add(String text) {
    if (text.isEmpty) {
      return 0;
    }
    return -1;
  }
}

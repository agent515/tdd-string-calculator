class NegativeArgumentError extends ArgumentError {
  final List<String> numbers;

  NegativeArgumentError(this.numbers)
      : super('Negative numbers are not allowed: ${numbers.join(',')}');

  @override
  String toString() {
    return 'Negative numbers are not allowed: ${numbers.join(',')}';
  }
}

double getNumber(double input, {int precision = 2}) {
  return double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));
}

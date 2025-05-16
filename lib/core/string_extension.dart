extension StringExt on String {
  String get capFirst {
    if (trim().isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

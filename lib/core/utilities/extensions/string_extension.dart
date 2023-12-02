extension StringIgnoreCase on String {
  /// function to compare two strings for equality
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }
}

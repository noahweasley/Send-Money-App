extension ErrorExtension on Exception {
  String get neatMessage {
    return toString().replaceFirst('Exception: ', '');
  }
}

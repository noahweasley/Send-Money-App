class RegexPattern {
  static RegExp emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static RegExp nigeriaPhoneNumberPattern = RegExp(r'^0[789]\d{9}$');
  static RegExp nigeriaPostalCodePattern = RegExp(r'^\d{6}$');
  static RegExp cityStatePattern = RegExp(r'^[A-Za-z\s]+,\s*[A-Za-z\s]+$', caseSensitive: false);
  static RegExp securePasswordPattern = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$');
}

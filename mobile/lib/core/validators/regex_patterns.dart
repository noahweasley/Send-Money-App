class RegexPattern {
  static RegExp email = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  static RegExp nigeriaPhoneNumber = RegExp(r'^0[789]\d{9}$');
  static RegExp securePassword = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$');
}

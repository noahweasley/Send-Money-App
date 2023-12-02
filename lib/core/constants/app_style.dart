import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_font.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/utilities/extensions/size_extensions.dart';

extension StyleExtension on TextStyle {
  /// make text bold
  TextStyle get bold {
    return copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  /// make text semi-bold
  TextStyle get semiBold {
    return copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  /// make text medium
  TextStyle get medium {
    return copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  /// make text normal
  TextStyle get normal {
    return copyWith(
      fontWeight: FontWeight.normal,
    );
  }

  /// make text normal
  TextStyle get monospaced {
    return copyWith(
      letterSpacing: 5,
    );
  }
}

/// Pre-configured app styles
class AppStyle {
  /// Base text style
  static const TextStyle baseTextStyle = TextStyle(
    fontFamily: AppFonts.openSans,
    color: Colors.black,
  );

  /// hidden text
  static TextStyle hidden = baseTextStyle.copyWith(height: 0);

  /// bold text style
  static TextStyle boldText = baseTextStyle.copyWith(
    fontWeight: FontWeight.bold,
  );

  /// Text style for headline 1.
  ///
  /// Font Size: 96.0,
  /// Font Weight: FontWeight.w300,
  /// Letter Spacing: -1.5,
  static TextStyle headline1 = TextStyle(
    fontSize: 94.0.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  /// Text style for headline1 with primary color.
  ///
  /// Inherits properties from [headline1].
  /// Color: AppColor.primary
  static TextStyle headline1Primary = headline1.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline 1 with primary dark color.
  ///
  /// Inherits properties from [headline1].
  /// Color: AppColor.primaryDark
  static TextStyle headline1PrimaryDark = headline1.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline 1 with secondary dark color.
  ///
  /// Inherits properties from [headline1].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline1SecondaryDark = headline1.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline 1 with green color.
  ///
  /// Inherits properties from [headline1].
  /// Color: AppColor.green
  static TextStyle headline1Green = headline1.copyWith(
    color: AppColor.green,
  );

  /// Text style for headline 2.
  ///
  /// Font Size: 60.0
  /// Font Weight: FontWeight.w300
  /// Letter Spacing: -0.5
  static TextStyle headline2 = TextStyle(
    fontSize: 58.0.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  /// Text style for headline2 with primary color.
  ///
  /// Inherits properties from [headline2].
  /// Color: AppColor.primary
  static TextStyle headline2Primary = headline2.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline 2 with primary dark color.
  ///
  /// Inherits properties from [headline2].
  /// Color: AppColor.primaryDark
  static TextStyle headline2PrimaryDark = headline2.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline 2 with secondary dark color.
  ///
  /// Inherits properties from [headline2].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline2SecondaryDark = headline2.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline 2 with green color.
  ///
  /// Inherits properties from [headline2].
  /// Color: AppColor.green
  static TextStyle headline2Green = headline2.copyWith(
    color: AppColor.green,
  );

  /// Text style for headline 3.
  ///
  /// Font Size: 48.0,
  /// Font Weight: FontWeight.normal,
  /// Letter Spacing: 0.0,
  static TextStyle headline3 = baseTextStyle.copyWith(
    fontSize: 46.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.5,
  );

  /// Text style for headline3 with primary color.
  ///
  /// Inherits properties from [headline3].
  /// Color: AppColor.primary
  static TextStyle headline3Primary = headline3.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline3 with primary dark color.
  ///
  /// Inherits properties from [headline3].
  /// Color: AppColor.primaryDark
  static TextStyle headline3PrimaryDark = headline3.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline3 with secondary dark color.
  ///
  /// Inherits properties from [headline3].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline3SecondaryDark = headline3.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline3 with green color.
  ///
  /// Inherits properties from [headline3].
  /// Color: AppColor.green
  static TextStyle headline3Green = headline3.copyWith(
    color: AppColor.green,
  );

  /// Text style for headline3 with red color.
  ///
  /// Inherits properties from [headline3].
  /// Color: AppColor.red
  static TextStyle headline3Red = headline3.copyWith(
    color: AppColor.red,
  );

  /// Text style for headline4.
  ///
  /// Font Size: 34.0,
  /// Font Weight: FontWeight.normal,
  /// Letter Spacing: 0.25,
  static TextStyle headline4 = baseTextStyle.copyWith(
    fontSize: 32.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  /// Text style for headline4 with primary color.
  ///
  /// Inherits properties from [headline4].
  /// Color: AppColor.primary
  static TextStyle headline4Primary = headline4.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline4 with primary dark color.
  ///
  /// Inherits properties from [headline4].
  /// Color: AppColor.primaryDark
  static TextStyle headline4PrimaryDark = headline4.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline4 with secondary dark color.
  ///
  /// Inherits properties from [headline4].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline4SecondaryDark = headline4.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline4 with green color.
  ///
  /// Inherits properties from [headline4].
  /// Color: AppColor.green
  static TextStyle headline4Green = headline4.copyWith(
    color: AppColor.green,
  );

  /// Text style for headline5.
  ///
  /// Font Size: 24.0,
  /// Font Weight: FontWeight.normal,
  /// Letter Spacing: 0.0,
  static TextStyle headline5 = baseTextStyle.copyWith(
    fontSize: 24.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
  );

  /// Text style for headline5 with primary color.
  ///
  /// Inherits properties from [headline5].
  /// Color: AppColor.primary
  static TextStyle headline5Primary = headline5.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline5 with primary dark color.
  ///
  /// Inherits properties from [headline5].
  /// Color: AppColor.primaryDark
  static TextStyle headline5PrimaryDark = headline5.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline5 with secondary dark color.
  ///
  /// Inherits properties from [headline5].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline5SecondaryDark = headline5.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline5 with green color.
  ///
  /// Inherits properties from [headline5].
  /// Color: AppColor.green
  static TextStyle headline5Green = headline5.copyWith(
    color: AppColor.green,
  );

  /// Text style for headline6.
  ///
  /// Font Size: 22.0,
  /// Font Weight: FontWeight.w500,
  /// Letter Spacing: 0.15,
  static TextStyle headline6 = baseTextStyle.copyWith(
    fontSize: 22.0.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  /// Text style for headline6 with primary color.
  ///
  /// Inherits properties from [headline6].
  /// Color: AppColor.primary
  static TextStyle headline6Primary = headline6.copyWith(
    color: AppColor.primary,
  );

  /// Text style for headline6 with primary dark color.
  ///
  /// Inherits properties from [headline6].
  /// Color: AppColor.primaryDark
  static TextStyle headline6PrimaryDark = headline6.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for headline6 with secondary dark color.
  ///
  /// Inherits properties from [headline6].
  /// Color: AppColor.secondaryDarker
  static TextStyle headline6SecondaryDark = headline6.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for headline6 with green color.
  ///
  /// Inherits properties from [headline6].
  /// Color: AppColor.green
  static TextStyle headline6Green = headline6.copyWith(
    color: AppColor.green,
  );

  /// Text style for title.
  ///
  /// Font Size: 18.0,
  /// Font Weight: FontWeight.w500,
  /// Letter Spacing: 0.15,
  static TextStyle title = baseTextStyle.copyWith(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  /// Text style for title with primary color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.primary
  static TextStyle titlePrimary = title.copyWith(
    color: AppColor.primary,
  );

  /// Text style for title with primary tint color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.primaryTint
  static TextStyle titlePrimaryTint = title.copyWith(
    color: AppColor.primaryTint,
  );

  /// Text style for title with primary dark color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.primaryDark
  static TextStyle titlePrimaryDark = title.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for title with white color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.white
  static TextStyle titleWhite = title.copyWith(
    color: AppColor.white,
  );

  /// Text style for title with error color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.red
  static TextStyle titleError = title.copyWith(
    color: AppColor.red,
  );

  /// Text style for title with secondary dark color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.secondaryDark
  static TextStyle titleSecondaryDark = title.copyWith(
    color: AppColor.secondaryDark,
  );

  /// Text style for title with secondary darker color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.secondaryDarker
  static TextStyle titleSecondaryDarker = title.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for title with green color.
  ///
  /// Inherits properties from [title].
  /// Color: AppColor.green
  static TextStyle titleGreen = title.copyWith(
    color: AppColor.green,
  );

  /// Text style for subtitle1.
  ///
  /// Font Size: 16.0,
  /// Font Weight: FontWeight.normal,
  /// Letter Spacing: 0.15,
  static TextStyle subtitle1 = baseTextStyle.copyWith(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  /// Text style for subtitle1 with primary color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.primary
  static TextStyle subtitle1Primary = subtitle1.copyWith(
    color: AppColor.primary,
  );

  /// Text style for subtitle1 with primary tint color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.primaryTint
  static TextStyle subtitle1PrimaryTint = subtitle1.copyWith(
    color: AppColor.primaryTint,
  );

  /// Text style for subtitle1 with primary dark color.
  ///
  ///  Inherits properties from [subtitle1].
  /// Color: AppColor.primaryDark
  static TextStyle subtitle1PrimaryDark = subtitle1.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for subtitle1 with secondary dark color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.secondaryDarker
  static TextStyle subtitle1SecondaryDarker = subtitle1.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for subtitle1 with secondary dark color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.secondaryDark
  static TextStyle subtitle1SecondaryDark = subtitle1.copyWith(
    color: AppColor.secondaryDark,
  );

  /// Text style for subtitle1 with green color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.green
  static TextStyle subtitle1Green = subtitle1.copyWith(
    color: AppColor.green,
  );

  /// Text style for subtitle1 with green color.
  ///
  /// Inherits properties from [subtitle1].
  /// Color: AppColor.red
  static TextStyle subtitle1Red = subtitle1.copyWith(
    color: AppColor.red,
  );

  /// Text style for subtitle2.
  static TextStyle subtitle2 = baseTextStyle.copyWith(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  /// Text style for subtitle2 with primary color.
  ///
  /// Inherits properties from [subtitle2].
  /// Color: AppColor.primary
  static TextStyle subtitle2Primary = subtitle2.copyWith(
    color: AppColor.primary,
  );

  /// Text style for subtitle2 with primary main color.
  ///
  /// Inherits properties from [subtitle2].
  /// Color: AppColor.primaryMain
  static TextStyle subtitle2PrimaryMain = subtitle2.copyWith(
    color: AppColor.primaryMain,
  );

  /// Text style for subtitle2 with primary dark color.
  static TextStyle subtitle2PrimaryDark = subtitle2.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for subtitle2 with secondary dark color.
  static TextStyle subtitle2SecondaryDark = subtitle2.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for subtitle2 with green color.
  static TextStyle subtitle2Green = subtitle2.copyWith(
    color: AppColor.green,
  );

  /// Text style for body1.
  static TextStyle body1 = baseTextStyle.copyWith(
    fontSize: 16.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
  );

  /// Text style for body1 with primary color.
  ///
  /// Inherits properties from [body1].
  /// Color: AppColor.primary
  static TextStyle body1Primary = body1.copyWith(
    color: AppColor.primary,
  );

  /// Text style for body1 with primary dark color.
  static TextStyle body1PrimaryDark = body1.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for body1 with secondary dark color.
  static TextStyle body1SecondaryDark = body1.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for body1 with green color.
  static TextStyle body1Green = body1.copyWith(
    color: AppColor.green,
  );

  /// Text style for body2.
  static TextStyle body2 = baseTextStyle.copyWith(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  /// Text style for body2 with primary color.
  ///
  /// Inherits properties from [body2].
  /// Color: AppColor.primary
  static TextStyle body2Primary = body2.copyWith(
    color: AppColor.primary,
  );

  /// Text style for body2 with primary dark color.
  static TextStyle body2PrimaryDark = body2.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for body2 with secondary dark color.
  static TextStyle body2SecondaryDark = body2.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for body2 with green color.
  static TextStyle body2Green = body2.copyWith(
    color: AppColor.green,
  );

  /// Text style for button.
  static TextStyle button = baseTextStyle.copyWith(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.8,
  );

  /// Text style for button with primary color.
  ///
  /// Inherits properties from [button].
  /// Color: AppColor.primary
  static TextStyle buttonPrimary = button.copyWith(
    color: AppColor.primary,
  );

  /// Text style for button with primary dark color.
  static TextStyle buttonPrimaryDark = button.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for button with secondary dark color.
  static TextStyle buttonSecondaryDark = button.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for button with green color.
  static TextStyle buttonGreen = button.copyWith(
    color: AppColor.green,
  );

  /// Text style for caption.
  static TextStyle caption = baseTextStyle.copyWith(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  /// Text style for caption with primary color.
  ///
  /// Inherits properties from [caption].
  /// Color: AppColor.primary
  static TextStyle captionPrimary = caption.copyWith(
    color: AppColor.primary,
  );

  /// Text style for caption with primary main color.
  ///
  /// Inherits properties from [caption].
  /// Color: AppColor.primaryMan
  static TextStyle captionPrimaryMain = caption.copyWith(
    color: AppColor.primaryMain,
  );

  /// Text style for caption with primary dark color.
  static TextStyle captionPrimaryDark = caption.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for caption with secondary dark color.
  static TextStyle captionSecondaryDark = caption.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for caption with green color.
  static TextStyle captionGreen = caption.copyWith(
    color: AppColor.green,
  );

  /// Text style for overline.
  static TextStyle overline = baseTextStyle.copyWith(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
  );

  /// Text style for overline with primary color.
  ///
  /// Inherits properties from [overline].
  /// Color: AppColor.primary
  static TextStyle overlinePrimary = overline.copyWith(
    color: AppColor.primary,
  );

  /// Text style for overline with primary dark color.
  static TextStyle overlinePrimaryDark = overline.copyWith(
    color: AppColor.primaryDark,
  );

  /// Text style for overline with secondary dark color.
  static TextStyle overlineSecondaryDark = overline.copyWith(
    color: AppColor.secondaryDarker,
  );

  /// Text style for overline with green color.
  static TextStyle overlineGreen = overline.copyWith(
    color: AppColor.green,
  );
}

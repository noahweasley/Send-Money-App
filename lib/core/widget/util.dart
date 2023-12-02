import 'package:flutter/material.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';

class WidgetUtil {
  static BorderRadius get borderRadiusCircularOnlyTop1 =>
      const BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius1));

  static BorderRadius get borderRadiusCircularOnlyTop2 =>
      const BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius2));

  static BorderRadius get borderRadiusCircularOnlyTop3 =>
      const BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius3));

  static BorderRadius get borderRadiusRoundedAllSides => const BorderRadius.all(Radius.circular(Dimensions.borderRadius1));
  static BorderRadius get borderRadiusRoundedAllSides2 => const BorderRadius.all(Radius.circular(Dimensions.borderRadius2));
  static BorderRadius get borderRadiusRoundedAllSides3 => const BorderRadius.all(Radius.circular(Dimensions.borderRadius3));
  static BorderRadius get borderRadiusRoundedAllSides4 => const BorderRadius.all(Radius.circular(Dimensions.borderRadius5));

  static BorderRadius get borderRadiusCircularAllSides1 => BorderRadius.circular(Dimensions.borderRadius1);
  static BorderRadius get borderRadiusCircularAllSides2 => BorderRadius.circular(Dimensions.borderRadius2);
  static BorderRadius get borderRadiusCircularAllSides3 => BorderRadius.circular(Dimensions.borderRadius3);
  static BorderRadius get borderRadiusCircularAllSides4 => BorderRadius.circular(Dimensions.borderRadius5);

  static Border get borderPrimaryDark => Border.all(color: AppColor.primaryDark, width: 1);
  static Border get borderPrimaryTint => Border.all(color: AppColor.primaryTint, width: 1);
  static Border get borderGreen => Border.all(color: AppColor.green, width: 1);
  static Border get borderPrimaryMain => Border.all(color: AppColor.primaryMain, width: 1);
  static Border get borderSecondaryDarker => Border.all(color: AppColor.secondaryDarker, width: 1);

  static Border get borderPrimaryDark2 => Border.all(color: AppColor.primaryDark, width: 2);
  static Border get borderPrimaryTint2 => Border.all(color: AppColor.primaryTint, width: 2);
  static Border get borderGreen2 => Border.all(color: AppColor.green, width: 2);
  static Border get borderPrimaryMain2 => Border.all(color: AppColor.primaryMain, width: 2);
  static Border get borderSecondaryDarker2 => Border.all(color: AppColor.secondaryDarker, width: 2);

  static List<BoxShadow> get boxShadowVertical => [
        const BoxShadow(
          blurRadius: 3,
          color: AppColor.cardShadowColor,
          offset: Offset(0, 4),
        ),
        const BoxShadow(
          blurRadius: 3,
          color: AppColor.cardShadowColor,
          offset: Offset(0, -4),
        )
      ];

  static List<BoxShadow> get boxShadowOnlyTop => [
        const BoxShadow(
          blurRadius: 3,
          color: AppColor.cardShadowColor,
          offset: Offset(0, -4),
        )
      ];

  static List<BoxShadow> get boxShadowOnlyBottom => [
        const BoxShadow(
          blurRadius: 3,
          color: AppColor.cardShadowColor,
          offset: Offset(0, 4),
        )
      ];
}

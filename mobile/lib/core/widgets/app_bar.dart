import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final Widget? title;
  final bool noTitle;
  final Widget? leadingIcon;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onNavigateUp;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.noTitle = false,
    this.centerTitle = true,
    this.bottom,
    this.actions,
    this.backgroundColor,
    this.onNavigateUp,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.systemOverlayColor,
        statusBarIconBrightness: Brightness.light, // For Android
        statusBarBrightness: Brightness.light, // For iOS
        systemNavigationBarColor: AppColor.systemOverlayColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.transparent,
      bottom: bottom,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: !automaticallyImplyLeading
          ? null
          : InkWell(
              onTap: onNavigateUp ?? Get.back,
              customBorder: const CircleBorder(),
              child: leadingIcon ??
                  InkWell(
                    onTap: onNavigateUp,
                    customBorder: const CircleBorder(),
                    child: leadingIcon ??
                        const Icon(
                          Icons.close,
                          size: 24,
                          color: AppColor.primaryDark,
                        ),
                  ),
            ),
      centerTitle: centerTitle,
      title: title,
    );
  }
}

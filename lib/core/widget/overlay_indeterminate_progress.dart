import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';

class OverlayIndeterminateProgress extends StatelessWidget {
  final Widget child;
  final String? loadingMessage;
  final Color? progressColor, overlayBackgroundColor;
  final bool isLoading;

  const OverlayIndeterminateProgress({
    Key? key,
    required this.child,
    this.loadingMessage,
    this.progressColor,
    required this.isLoading,
    this.overlayBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Opacity(
              opacity: 0.3,
              child: ModalBarrier(
                dismissible: false,
                color: overlayBackgroundColor?.withOpacity(0.3) ?? AppColor.background.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 80,
                  height: 10,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: LinearProgressIndicator(
                      backgroundColor: (progressColor ?? AppColor.primaryDark).withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? AppColor.primaryDark),
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.space1),
                Material(
                  color: Colors.transparent,
                  child: Text(
                    loadingMessage ?? 'Loading',
                    style: AppStyle.body1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

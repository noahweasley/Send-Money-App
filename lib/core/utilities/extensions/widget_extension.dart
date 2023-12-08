import 'package:flutter/material.dart';
import 'package:veegil/core/constants/colors.dart';

extension WidgetExtension on Widget? {
  /// With custom height and width
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  /// With custom width
  Widget withWidth(double width, {bool shouldSize = true}) {
    return shouldSize ? SizedBox(width: width, child: this) : this!;
  }

  ColoredBox withColor({Color color = AppColor.background}) {
    return ColoredBox(color: color, child: this);
  }

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  Widget addHeight(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this ?? Container(),
        SizedBox(
          height: height,
        )
      ],
    );
  }

  Widget addWidth(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        this ?? Container(),
        SizedBox(
          width: width,
        )
      ],
    );
  }

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double? vertical,
    double? horizontal,
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal ?? left, vertical ?? top, horizontal ?? right, vertical ?? bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add opacity to parent widget
  Widget opacity({
    required double opacity,
    int durationInSecond = 1,
    Duration? duration,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration ?? const Duration(milliseconds: 500),
      child: this,
    );
  }

  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add translate to parent widget
  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
    Key? key,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      key: key,
      child: this,
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({bool shouldExpand = true, int flex = 1, bool scrollable = false}) {
    if (shouldExpand) {
      return Expanded(
        flex: flex,
        child: scrollable ? SingleChildScrollView(child: this!) : this!,
      );
    } else {
      return scrollable ? SingleChildScrollView(child: this!) : this!;
    }
  }

  /// add Flexible to parent widget
  Widget flexible({int flex = 1, FlexFit? fit}) {
    return Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this!);
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this ?? value;
}

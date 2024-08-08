import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/extensions/widget_extension.dart';

class AppTextField extends StatelessWidget {
  final bool? autofocus;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final double borderRadius;
  final TextInputType? keyboardType;
  final String? hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool hasBorder;
  final Color? fillColor;
  final int? maxLines;
  final bool? enabled;
  final String? title;
  final void Function()? onTap;
  final double contentPadding;
  final String? initialValue;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLength;
  final bool reserveErrorSpace;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    super.key,
    this.autofocus,
    this.readOnly,
    this.autovalidateMode,
    this.validator,
    this.borderRadius = Dimensions.borderRadius2,
    this.keyboardType,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.hasBorder = true,
    this.fillColor = Colors.transparent,
    this.maxLines = 1,
    this.enabled,
    this.title,
    this.onTap,
    this.contentPadding = 16,
    this.initialValue,
    this.style,
    this.hintStyle,
    this.maxLength,
    this.reserveErrorSpace = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: AppStyle.subtitle1PrimaryDark,
              ).addHeight(4)
            : Container(),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: !reserveErrorSpace ? 0.0 : 70.0,
          ),
          child: TextFormField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            autofocus: autofocus ?? false,
            readOnly: readOnly ?? false,
            style: style ?? AppStyle.subtitle2PrimaryDark,
            initialValue: initialValue,
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
            validator: validator ?? (value) => value != null && value.isEmpty ? 'Field can\'t be empty' : null,
            obscureText: obscureText,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            maxLines: maxLines,
            enabled: enabled,
            decoration: InputDecoration(
              labelStyle: style,
              counterText: '',
              counterStyle: AppStyle.hidden,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColor.green,
                ),
              ),
              isDense: true,
              fillColor: AppColor.white,
              filled: true,
              contentPadding: EdgeInsets.all(
                contentPadding,
              ),
              hintText: hintText,
              hintStyle: hintStyle ?? AppStyle.subtitle1PrimaryTint,
              suffixIcon: suffixIcon != null
                  ? UnconstrainedBox(
                      alignment: Alignment.center,
                      child: suffixIcon,
                    ).paddingAll(8)
                  : null,
              prefixIcon: prefixIcon != null
                  ? UnconstrainedBox(
                      alignment: Alignment.center,
                      child: prefixIcon,
                    ).paddingAll(8)
                  : null,
              border: hasBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: const BorderSide(),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide.none,
                    ),
              errorBorder: hasBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: const BorderSide(
                        color: AppColor.red,
                        width: 1,
                      ),
                    )
                  : InputBorder.none,
              focusedErrorBorder: hasBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: const BorderSide(
                        color: AppColor.red,
                        width: 1,
                      ),
                    )
                  : InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    ).paddingBottom(reserveErrorSpace ? 0.0 : Dimensions.space1);
  }
}

import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/utilities/extensions/size_extensions.dart';
import 'package:veegil/core/utilities/extensions/widget_extension.dart';
import 'package:veegil/core/widgets/util.dart';

class AppCheckBox extends StatefulWidget {
  final String? text;
  final bool checked;
  final void Function(bool)? onChanged;
  final Color activeColor;
  final Color checkColor;
  final OutlinedBorder? shape;
  final double size;
  final int maxLines;
  final bool shouldFillUpSpace;
  final double textWidth;
  final Widget? child;

  const AppCheckBox({
    super.key,
    this.text,
    required this.checked,
    this.onChanged,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(1.0),
      ),
    ),
    this.activeColor = AppColor.red,
    this.checkColor = AppColor.white,
    this.size = 16.0,
    this.maxLines = 3,
    this.shouldFillUpSpace = false,
    this.textWidth = 300.0,
    this.child,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: WidgetUtil.borderRadiusRoundedAllSides,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: WidgetUtil.borderRadiusRoundedAllSides,
        ),
        child: InkWell(
          onTap: () {
            if (widget.onChanged != null) {
              widget.onChanged!(isChecked = !widget.checked);
            }
          },
          child: Row(
            children: [
              Container(
                height: widget.size,
                width: widget.size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.2,
                    color: widget.checked ? Colors.transparent : AppColor.primaryTint,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                  color: widget.checked ? AppColor.green : Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: widget.checked
                      ? Icon(
                          Icons.check,
                          size: widget.size - 4,
                          color: AppColor.white,
                        )
                      : Container(),
                ),
              ),
              widget.child ??
                  Visibility(
                    visible: widget.text != null,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          widget.text ?? '',
                          textAlign: TextAlign.left,
                          maxLines: widget.maxLines,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: AppStyle.button,
                        ).expand(shouldExpand: widget.shouldFillUpSpace),
                      ],
                    ).withWidth(
                      widget.textWidth.w,
                      shouldSize: widget.shouldFillUpSpace,
                    ),
                  ),
            ],
          ).paddingAll(Dimensions.space1),
        ),
      ),
    );
  }
}

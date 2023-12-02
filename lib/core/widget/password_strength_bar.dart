import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';

enum Strength { weak, moderate, secure }

class PasswordStrengthBar extends StatelessWidget {
  final Strength strength;

  const PasswordStrengthBar({
    Key? key,
    required this.strength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 7,
                      width: constraints.maxWidth / 5,
                      decoration: const BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      height: 7,
                      width: constraints.maxWidth / 5,
                      decoration: BoxDecoration(
                        color: [Strength.moderate, Strength.secure].contains(strength)
                            ? AppColor.secondaryDark
                            : AppColor.primaryTint,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 7,
                    width: constraints.maxWidth / 5,
                    decoration: BoxDecoration(
                      color: strength == Strength.secure ? AppColor.green : AppColor.primaryTint,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                strength == Strength.weak ? 'Weak!' : (strength == Strength.moderate ? 'Almost!' : 'Strong!'),
                textAlign: TextAlign.right,
                style: AppStyle.body2,
              ),
            ),
          ],
        );
      },
    );
  }
}

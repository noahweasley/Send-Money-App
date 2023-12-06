import 'package:flutter/material.dart';
import 'package:veegil/core/constants/app_style.dart';
import 'package:veegil/core/constants/colors.dart';
import 'package:veegil/core/widget/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Account',
          style: AppStyle.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}

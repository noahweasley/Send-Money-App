import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veegil/core/constants/dimensions.dart';

class ListShimmer extends StatelessWidget {
  final int itemCount;
  final Widget loadingPlaceholder;
  final bool isLoading;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ListShimmer({
    super.key,
    required this.isLoading,
    required this.itemCount,
    required this.loadingPlaceholder,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: itemCount,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: Dimensions.space2);
                },
                itemBuilder: (context, index) {
                  return loadingPlaceholder;
                },
              ),
            ),
          )
        : child;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.onTap, required this.child, super.key,
    this.isEnabled = false,
  });

  final VoidCallback? onTap;
  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isBtnEnabled = isEnabled
        ? primaryColor
        : primaryColor.withValues(alpha: 0.5);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          width: 1.sw,
          height: 52.h,
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: isBtnEnabled,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Align(child: child),
        ),
      ),
    );
  }
}

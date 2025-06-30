import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onTap, required this.child, this.isEnabled = false});

  final VoidCallback? onTap;
  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Ink(
          width: 1.sw,
          height: 60.h,
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: isEnabled ? Theme.of(context).colorScheme.primary : Colors.grey,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Align(alignment: Alignment.center, child: child),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onTap, required this.child});

  final VoidCallback? onTap;
  final Widget child;

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
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Align(
            alignment: Alignment.center,
            child: child
          ),
        ),
      ),
    );
  }
}
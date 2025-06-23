import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatefulWidget {
  const DefaultFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.errorText,
    this.hintText,
    this.isPassword = false,
    this.prefixIcon,
    this.keyboardType,
    this.obscureInitially = true,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? errorText;
  final String? hintText;
  final bool isPassword;
  final bool obscureInitially;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureInitially;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _isObscure : false,
      validator: widget.validator,
      onChanged: widget.onChanged,

      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            size: 24.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,
      ),
    );
  }
}
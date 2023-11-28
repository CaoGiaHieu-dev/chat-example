
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extensions/context_extension.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.controller,
    this.title,
    this.validator,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final String? title;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final focusNode = FocusNode();
  bool isHidePassword = true;

  @override
  void initState() {
    isHidePassword = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            SizedBox(height: 5.h),
            TextFormField(
              obscureText: widget.isPassword ? isHidePassword : false,
              controller: widget.controller,
              validator: widget.validator,
              onChanged: (value) {},
              decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isHidePassword = !isHidePassword;
                          });
                        },
                        icon: Icon(
                          isHidePassword
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_rounded,
                        ),
                      )
                    : null,
                border: const OutlineInputBorder(),
                errorBorder: const OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 2.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

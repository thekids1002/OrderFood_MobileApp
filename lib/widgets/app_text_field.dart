import 'package:flutter/material.dart';
import 'package:orderfood1/utils/reponsive.dart';

class AppTextField extends StatefulWidget {
  final bool isPassword;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const AppTextField({
    super.key,
    this.isPassword = false,
    this.hintText = '',
    this.validator ,
    this.controller,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      validator: widget.validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        errorMaxLines: 2,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: UtilSize.responsiveFontSize(context, 12),
          color: Colors.grey, // Màu hint text
          fontFamily: 'SF-PRO',
        ),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
      ),
      onChanged: (value) {
        // Xử lý thay đổi giá trị ở đây nếu cần
        print("Value changed: $value");
      },
      enableSuggestions: !widget.isPassword, // Tắt gợi ý khi nhập mật khẩu
      autocorrect: !widget.isPassword,
      style: TextStyle(
          fontSize: UtilSize.responsiveFontSize(context, 14),
          color: Colors.black, // Màu chữ
          fontFamily: 'SF-PRO',
          fontWeight:
              FontWeight.w200), // Tắt chính tả tự động khi nhập mật khẩu
    );
  }
}

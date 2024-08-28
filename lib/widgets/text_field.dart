import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
  final bool isPassword; 

  const BaseTextField({
    super.key,
    this.isPassword = false, 
  });

  @override
  _BaseTextFieldState createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      obscureText: widget.isPassword, 
      decoration: InputDecoration(
        hintText: widget.isPassword ? 'Password' : 'Enter text',
        border: UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: UnderlineInputBorder(
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
      autocorrect: !widget.isPassword, // Tắt chính tả tự động khi nhập mật khẩu
    );
  }
}

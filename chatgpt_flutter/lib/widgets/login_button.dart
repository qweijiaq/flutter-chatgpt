// 带禁用功能的按钮
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginButton(this.title,
      {super.key, this.enable = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      height: 45,
      onPressed: enable ? onPressed : null,
      color: Colors.blue,
      disabledColor: Colors.blueGrey,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

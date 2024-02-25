// 登录页
import 'package:chatgpt_flutter/utils/padding_extension.dart';
import 'package:chatgpt_flutter/utils/string_util.dart';
import 'package:chatgpt_flutter/widgets/input_widget.dart';
import 'package:chatgpt_flutter/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? username;
  String? password;

  get _background {
    return [
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  get _content {
    return Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          100.paddingHeight,
          const Text(
            'Gopher ChatGPT',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          40.paddingHeight,
          InputWidget(
            hint: '请输入账号',
            onChanged: (text) {
              username = text;
              _checkInput();
            },
          ),
          40.paddingHeight,
          InputWidget(
            hint: '请输入密码',
            onChanged: (text) {
              password = text;
              _checkInput();
            },
          ),
          45.paddingHeight,
          LoginButton(
            '登录',
            enable: loginEnable,
            onPressed: () => _login(context),
          ),
          15.paddingHeight,
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _jumpRegistration,
              child: Text('注册账号', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [..._background, _content],
      ),
    );
  }

  _jumpRegistration() async {
    // 跳转到接口后台注册账号
    Uri uri = Uri.parse('https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $uri');
    }
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(username) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }

    setState(() {
      loginEnable = enable;
    });
  }

  _login(BuildContext context) {
    // TODO
  }
}

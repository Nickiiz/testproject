// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_function_declarations_over_variables, prefer_const_declarations, sort_child_properties_last, avoid_print, avoid_single_cascade_in_expression_statements

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_fullstack/src/config/route.dart';
import 'package:learn_flutter_fullstack/src/config/theme.dart' as custom_them;
import 'package:learn_flutter_fullstack/src/config/route.dart' as custom_route;
import 'package:learn_flutter_fullstack/src/constants/setting.dart';

import 'package:learn_flutter_fullstack/src/utils/RegexValidator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFrom extends StatefulWidget {
  const LoginFrom({super.key});

  @override
  State<LoginFrom> createState() => _LoginFromState();
}

class _LoginFromState extends State<LoginFrom> {
  late TextEditingController usernameCtrl;
  late TextEditingController passwordCtrl;
  String? _errorUsername;
  String? _errorPassword;

  showWarningDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'คำเตือน',
            style: GoogleFonts.kanit(),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ตกลง',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // if (usernameCtrl != null) {
    //   usernameCtrl.dispose();
    // }เขียนแบบเต็ม
    usernameCtrl.dispose(); //เขียนแบบย่อ
    passwordCtrl.dispose(); //เขียนแบบย่อ

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildFrom(),
        _buildSubmitFromButton(),
      ],
    );
  }

  Card _buildFrom() => Card(
        margin: EdgeInsets.only(bottom: 22, left: 22, right: 22),
        elevation: 10,
        color: Colors.white, //เงา
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 30, left: 20, right: 20),
          child: FormInput(
            usernameCtrl: usernameCtrl,
            passwordCtrl: passwordCtrl,
            errorUsername: _errorUsername,
            errorPassword: _errorPassword,
          ),
        ),
      );

  Container _buildSubmitFromButton() => Container(
        child: TextButton(
            onPressed: _onLogin,
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
      );

  void showAlertBar() {
    Flushbar(
      title: "Username or Password is incorrect",
      message: "Please try again",
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    )..show(context);
  }

  void showLoading() {
    Flushbar(
      message: "Loading....",
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    )..show(context);
  }

  void _onLogin() {
    String username = usernameCtrl.text;
    String password = passwordCtrl.text;

    _errorUsername = null;
    _errorPassword = null;

    if (!EmailSubmitRegexValidator().isValid(username)) {
      _errorUsername = 'อีเมลไม่ถูกต้อง';
    }

    if (password.length < 8) {
      _errorPassword = 'อย่างน้อง 8 ตัวอักษร';
    }
    if (_errorUsername == null && _errorPassword == null) {
      showLoading();
      Future.delayed(Duration(seconds: 2)).then((value) async {
        Navigator.pop(context);
        if (username == 'nick.555@gmail.com' && password == '12345678') {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(),
          //   ),
          // );

          SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString(Setting.TOKEN_PREF, 'xxxx');
          // prefs.setString(Setting.USERNAME_PREF, username);

          print(prefs);

          Navigator.pushReplacementNamed(context, custom_route.Route.home);
        } else {
          showAlertBar();
          setState(() {});
        }
      });
    } else {
      setState(() {});
    }

    // if (usernameCtrl.text.trim().isEmpty) {
    //   showWarningDialog(context, 'ป้อนอีเมลด้วย');
    // } else if (passwordCtrl.text.trim().isEmpty) {
    //   showWarningDialog(context, 'ป้อนพาสเวิดด้วย');
    // }
  }
}

BoxDecoration _boxDecoration() {
  final gradientStart = custom_them.Them.gradientStart;
  final gradientEnd = custom_them.Them.gradientEnd;
  final boxShadowItem = (Color color) => BoxShadow(
        color: gradientStart,
        offset: Offset(1, 2.0),
        blurRadius: 20.0,
      );
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    boxShadow: [
      boxShadowItem(gradientStart),
      boxShadowItem(gradientEnd),
    ],
    gradient: LinearGradient(
      colors: [
        custom_them.Them.gradientEnd,
        custom_them.Them.gradientStart,
      ],
      begin: const FractionalOffset(
        0,
        0.5,
      ),
      end: const FractionalOffset(
        1.5,
        1,
      ),
    ),
  );
}

class FormInput extends StatefulWidget {
  final TextEditingController usernameCtrl;
  final TextEditingController passwordCtrl;
  final String? errorUsername;
  final String? errorPassword;
  const FormInput({
    Key? key,
    required this.usernameCtrl,
    required this.passwordCtrl,
    required this.errorUsername,
    required this.errorPassword,
  }) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;
  late bool _obscureTextPassword;
  final _passwordFocusNode = FocusNode();
  @override
  void initState() {
    _obscureTextPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserName(),
        Divider(
          height: 22,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        _buildPassword(),
      ],
    );
  }

  TextStyle _textStyle() => TextStyle(
        fontWeight: FontWeight.bold,
        color: _color,
      );

  TextField _buildPassword() => TextField(
        focusNode: _passwordFocusNode,
        controller: widget.passwordCtrl,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: 'Password',
          labelStyle: _textStyle(),
          icon: FaIcon(
            FontAwesomeIcons.lock,
            size: 30,
            color: _color,
          ),
          errorText: widget.errorPassword,
          suffix: IconButton(
            icon: FaIcon(
              _obscureTextPassword
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              color: _color,
              size: 15.0,
            ),
            onPressed: () {
              setState(() {
                _obscureTextPassword =
                    !_obscureTextPassword; //เปิดปิดตา password
              });
            },
          ),
        ),
        obscureText: !_obscureTextPassword,
      );

  TextField _buildUserName() {
    return TextField(
      controller: widget.usernameCtrl,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: _textStyle(),
        labelText: 'Email Address',
        hintText: 'Example@email.com',
        icon: FaIcon(
          FontAwesomeIcons.envelope,
          size: 30,
          color: _color,
        ),
        errorText: widget.errorUsername,
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
    );
  }
}

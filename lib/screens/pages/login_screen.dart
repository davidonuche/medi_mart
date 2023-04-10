import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medi_mart/utils/colors.dart';
import 'package:medi_mart/utils/images.dart';
import '../../utils/route_names.dart';
import '../../utils/texts.dart';
import '../../home.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _obscureTextLogin = true, _enable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              end: -70,
              top: -80,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColor.kdarkblue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              end: -30,
              top: -55,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColor.kblue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          AppImages.banner,
                          height: 120,
                          width: 120,
                        ),
                      ),
                      SizedBox(height: 74),
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                            letterSpacing: -0.5,
                            color: AppColor.kdarkblue,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      Text(
                        "Enter your login details to continue",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColor.kblue),
                      ),
                      SizedBox(height: 34),
                      Text('Email Address'),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          RegExp regex = RegExp(
                            AppTexts.emailVerificationPattern.toString(),
                          );
                          if (!regex.hasMatch(value!.trim())) {
                            return 'Invalid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      Text('Password'),
                      TextFormField(
                        controller: _pass,
                        obscureText: _obscureTextLogin,
                        decoration:
                            InputDecoration(hintText: 'Enter your password'),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        // suffixIcon: IconButton(
                        //   onPressed: () => _toggleLogin(),
                        //   icon: _chgIcon(),
                        // ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Empty field detected';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, forgetPassRoute),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: AppColor.kdarkblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 74),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                            // if (_formKey.currentState!.validate()) {
                            //   login();
                            // }
                          },
                          child: Text('LOG IN'),
                          // enable: _enable,
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: AppColor.kdarkblue,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: AppColor.kdarkblue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    startLoading();
    // ApiFunctions.login(
    //   context,
    //   email: _email.text,
    //   pass: _pass.text,
    // ).then((v) {
    //   stopLoading();
    // });
  }

  Widget _chgIcon() {
    return !_obscureTextLogin
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);
  }

  _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void startLoading() {
    setState(() {
      _enable = false;
    });
  }

  void stopLoading() {
    setState(() {
      _enable = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
  }
}

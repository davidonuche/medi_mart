import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../home.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/route_names.dart';
import '../../utils/texts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  bool _obscureTextLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.directional(
            textDirection: TextDirection.ltr,
            end: -60,
            top: -100,
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
            top: 55,
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
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                  key: _formKey,
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
                      SizedBox(height: 30),
                      Text(
                        "Let's get started!",
                        style: TextStyle(
                          letterSpacing: -0.5,
                          color: AppColor.kdarkblue,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kindly enter your full name, email address and \npassword to create an account',
                        style: TextStyle(
                          color: AppColor.kblue,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 34),
                      Text('Full Name'),
                      TextFormField(
                        controller: _fullname,
                        decoration:
                            InputDecoration(hintText: 'Enter your full name'),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onChanged: (v) {
                          setState(() {
                          });
                          return null;
                        },
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Full name cannot be less than 4 characters';
                          } else if (!value.contains(' ')) {
                            return 'Kindly enter your full name';
                          } else if (value.split(' ')[1].length < 2) {
                            return 'Kindly enter your last name';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Text('Email Address'),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: 'Enter your email address'),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (v) {
                          setState(() {
                          });
                          return null;
                        },
                        validator: (value) {
                          RegExp regex = RegExp(
                              AppTexts.emailVerificationPattern.toString());
                          if (!regex.hasMatch(value!.trim())) {
                            return 'Invalid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      Text('Password'),
                      TextFormField(
                        controller: _pass,
                        obscureText: _obscureTextLogin,
                        decoration:
                            InputDecoration(hintText: 'Create your password'),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        onChanged: (v) {
                          setState(() {
                          });
                          return null;
                        },
                        // suffixIcon: IconButton(
                        //   onPressed: () => _toggleLogin(),
                        //   icon: _chgIcon(),
                        // ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password cannot be less than 6';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: agree,
                            onChanged: (v) {
                              setState(() {
                                agree = !agree;
                              });
                            },
                          ),
                          Text.rich(
                            TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                color: AppColor.kdarkblue,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: AppColor.kblue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.dotted,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, loginRoute),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                          child: Text('SIGN UP'),
                          // enable: _enable,
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
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
                  )),
            ),
          ))
        ],
      ),
    );
  }



  void startLoading() {
    setState(() {
    });
  }

  void stopLoading() {
    setState(() {
    });
  }
}

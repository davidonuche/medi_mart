import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_info_model.dart';
import '../services/api_functions.dart';
import '../utils/colors.dart';
import '../widgets/bottomsheet_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPass = TextEditingController();
  final TextEditingController _newpass = TextEditingController();
  bool _obscureTextLogin = true, _startloading = false, _enable = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.r),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<UserInfoData>('localDB').listenable(),
          builder: (context, box, widg) {
            var user = box.get('userInfo');
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: AppColor.kdarkblue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  formHead('Old Password'),
                  AppTextFormField(
                    controller: _oldPass,
                    obscureText: _obscureTextLogin,
                    hintText: 'Enter your old password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      setState(() {
                        _enable = _formKey.currentState!.validate();
                      });
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => _toggleLogin(),
                      icon: _chgIcon(),
                    ),
                    validator: (value) {
                      if (value != user!.password) {
                        return 'Incorrect password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  formHead('New Password'),
                  AppTextFormField(
                    controller: _newpass,
                    obscureText: _obscureTextLogin,
                    hintText: 'Create a new password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    onChanged: (v) {
                      setState(() {
                        _enable = _formKey.currentState!.validate();
                      });
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () => _toggleLogin(),
                      icon: _chgIcon(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Empty field detected';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 34.h),
                  ButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        changePassword();
                      }
                    },
                    txt: 'CHANGE PASSWORD',
                    enable: _enable,
                    load: _startloading,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void changePassword() {
    startLoading();
    ApiFunctions.changePass(context, _newpass.text).then((v) {
      stopLoading();
      Navigator.pop(context);
    });
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
      _startloading = true;
      _enable = false;
    });
  }

  void stopLoading() {
    setState(() {
      _startloading = false;
      _enable = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _oldPass.dispose();
    _newpass.dispose();
  }
}

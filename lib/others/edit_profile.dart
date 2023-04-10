import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../function/location_func.dart';
import '../models/user_info_model.dart';
import '../services/api_functions.dart';
import '../utils/colors.dart';
import '../widgets/bottomsheet_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _name, _city, _country;
  bool _startloading = false, _enable = true;

  @override
  void initState() {
    super.initState();
    getCurrentLocation(context).then((value) {
      getAddressFromLatLng(value).then((value) {
        var addr = value.split(',');
        setState(() {
          _country = TextEditingController(text: '${addr[0]} ');
          _city = TextEditingController(text: '${addr[1]}, ${addr[2]}');
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<UserInfoData>('localDB').listenable(),
          builder: (context, box, widg) {
            var user = box.get('userInfo');
            _name = TextEditingController(text: user!.name);
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: AppColor.kdarkblue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  formHead('Full Name'),
                  AppTextFormField(
                    controller: _name,
                    hintText: 'Enter your full name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
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
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: formHead('City')),
                      SizedBox(width: 20),
                      Expanded(child: formHead('Country')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          controller: _city,
                          hintText: 'Enter your city',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Empty field detected';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: AppTextFormField(
                          controller: _country,
                          hintText: 'Enter your country',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Empty field detected';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 34),
                  ButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        editProfile(
                          {
                            'email': user.email,
                            'individual': user.type,
                            'uid': user.uid,
                            'verified': user.isVerified,
                            'pass': user.password,
                            'date': user.timejoined,
                          },
                        );
                      }
                    },
                    txt: 'SUBMIT',
                    enable: _enable,
                    load: _startloading,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void editProfile(Map data) {
    startLoading();
    ApiFunctions.editProfile(
      context,
      name: _name!.text,
      city: _city!.text,
      country: _country!.text,
      data: data,
    ).then((v) {
      stopLoading();
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
    _name!.dispose();
    _city!.dispose();
    _country!.dispose();
  }
}

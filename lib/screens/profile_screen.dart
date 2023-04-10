import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:medi_mart/utils/colors.dart';
// import '../../models/user_info_model.dart';
import '../others/edit_profile.dart';
import '../register/change_password.dart';
import '../utils/route_names.dart';
import '../widgets/dialog_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //     valueListenable: Hive.box<UserInfoData>('localDB').listenable(),
    //     builder: (context, box, widg) {
    //       var user = box.get('userInfo');
    //       var initial = user!.name.split('');
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.klemon,
        elevation: 0,
        title: Center(child: Text("Profile")),
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColor.mainColor,
                  isScrollControlled: true,
                  builder: (_) {
                    return EditProfile();
                  });
            },
            child: Text('Edit', style: TextStyle(color: AppColor.kdarkblue)),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: decoration,
                child: Column(
                  children: [
                    SizedBox(height: 18),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.kdarkblue,
                      child: Text(
                        'David',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "David Onuche",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 28),
                    prfTile('Email', "onuchedavid34@gmail.com"),
                    const Divider(thickness: 0.4),
                    SizedBox(height: 8),
                    prfTile('City', "Lagos"),
                    const Divider(thickness: 0.4),
                    SizedBox(height: 8),
                    prfTile('Country', "Nigeria"),
                    const Divider(thickness: 0.4),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: decoration,
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) {
                        return const ChangePassword();
                      },
                    );
                  },
                  leading: const Icon(Icons.key),
                  title: const Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: decoration,
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, privacyPolicyRoute),
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy '),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: decoration,
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return DialogWidget.dialog(
                          context,
                          title: 'Log Out',
                          content: 'Are you sure you want to log out?',
                          btnName: 'Log Out',
                          onTap: () async {
                            await FirebaseAuth.instance.signOut().then((value) {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, loginRoute);
                            });
                          },
                        );
                      },
                    );
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: AppColor.kblue,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: AppColor.kblue),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          )),
    );
    //     },
    // );
  }

  Widget prfTile(String title, String subtitle) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(
              color: AppColor.kdarkblue,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            subtitle,
            style: TextStyle(
              color: AppColor.kdarkblue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Decoration? decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.06),
        blurRadius: 25.0,
        spreadRadius: 5.0,
        offset: const Offset(15.0, 15.0),
      )
    ],
  );
}

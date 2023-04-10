import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens/pages/onboarding_screen.dart';
import 'utils/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _comfirmLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/banner.png',
              height: 150,
              width: 400,
            ),
            Text(
              'Medi Mart',
              style: TextStyle(
                color: AppColor.kblue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SpinKitPumpingHeart(color: AppColor.klemon, size: 50.0),
          ],
        ),
      ),
    );
  }

  _comfirmLogin() {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

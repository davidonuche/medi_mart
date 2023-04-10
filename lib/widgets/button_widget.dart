import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String txt;
  final bool load, enable;
  final double? width;
  final Widget? child;
  final Color? color;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.txt,
    this.child,
    this.load = false,
    this.enable = true,
    this.width = double.infinity,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (color) ??
            (enable ? AppColor.mainColor : AppColor.mainColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: width,
      height: 45.h,
      child: MaterialButton(
        elevation: 0,
        onPressed: enable
            ? () {
                FocusManager.instance.primaryFocus?.unfocus();
                onPressed();
              }
            : null,
        child: child ??
            (load
                ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.8,
                  )
                : Text(
                    txt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
      ),
    );
  }
}

class OutlineButtonWidget extends StatelessWidget {
  final String? btnName;
  final void Function() onPressed;
  final double? width;
  final Widget? child;
  const OutlineButtonWidget({
    Key? key,
    this.btnName,
    required this.onPressed,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 45.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: AppColor.kblue, width: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
        child: child ??
            FittedBox(
              child: Text(
                '$btnName',
                style: TextStyle(
                  color: AppColor.kdarkblue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
      ),
    );
  }
}

class ElevatedBtn extends StatelessWidget {
  final String txt, routeName;
  final Function()? function;
  final Object? arguments;
  const ElevatedBtn(
      {Key? key,
      required this.txt,
      required this.routeName,
      this.function,
      this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
        onPressed: function ??
            () {
              Navigator.pushNamed(context, routeName, arguments: arguments);
            },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          backgroundColor: AppColor.klemon,
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.kdarkblue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

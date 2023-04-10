import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../utils/constants.dart';
import '../utils/route_names.dart';

enum AlertType {
  success,
  error,
  random,
}

class AppFunction {
  static Color _getTypeColor(AlertType type) {
    switch (type) {
      case AlertType.random:
        return const Color(0xFFA3A3A5);
      case AlertType.success:
        return Colors.green;
      case AlertType.error:
        return const Color(0xFFAD2121);
      default:
        return const Color(0xFF160A0A);
    }
  }

  static showAlert(
    BuildContext context,
    String txt, {
    AlertType type = AlertType.random,
    StyledToastPosition position = StyledToastPosition.top,
  }) {
    return showToast(
      txt,
      context: context,
      backgroundColor: _getTypeColor(type),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: position,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

  static snackBar(BuildContext context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
      ),
    );
  }

  static void logout() async {
    if (navigatorKey.currentState != null) {
      await FirebaseAuth.instance.signOut().then((value) {
        navigatorKey.currentState!.pushReplacementNamed(loginRoute);
      });
    }
  }

  static void forcedLogout(String e) {
    if (e == "permission-denied") logout();
  }
}

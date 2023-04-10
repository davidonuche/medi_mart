import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogWidget {
  static Widget dialog(BuildContext context, {title, content, onTap, btnName}) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(btnName),
              ),
            ],
          )
        : AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: onTap,
                child: Text(btnName),
              ),
            ],
          );
  }
}

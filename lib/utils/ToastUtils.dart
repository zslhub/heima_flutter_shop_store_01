import 'package:flutter/material.dart';

class Toastutils {
  static void showToast(BuildContext context, String? msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg ?? '刷新完成', textAlign: TextAlign.center),
        width: 100,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}

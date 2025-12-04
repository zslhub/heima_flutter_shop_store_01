import 'package:flutter/material.dart';

class Toastutils {
  static bool _isShowing = false;
  static void showToast(BuildContext context, String? msg) {
    if (Toastutils._isShowing) return;
    Toastutils._isShowing = true;
    Future.delayed(Duration(seconds: 1), () {
      Toastutils._isShowing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg ?? '刷新完成', textAlign: TextAlign.center),
        width: 250,
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}

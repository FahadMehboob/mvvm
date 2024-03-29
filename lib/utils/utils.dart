import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void FlushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: message,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          title: "Error",
          duration: const Duration(seconds: 5),
          icon: const Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }

  static void FlushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          message: message,
          backgroundColor: Colors.green,
          borderRadius: BorderRadius.circular(10),
          title: "Success",
          duration: const Duration(seconds: 5),
          icon: const Icon(
            Icons.check_circle,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }
}

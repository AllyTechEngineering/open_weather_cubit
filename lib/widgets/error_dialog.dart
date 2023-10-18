import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// # void type errorDialog method
/// ## BuildContext and weatherState error property erroMessage as arguments
/// * Code implementation discussed in Step 66 video 0:0 to 0:20 time stamp.
/// * Platform check for iOS and return CupertinoAlertDialog.
/// * Use CupertinoDialogAction to dismiss the alert.
/// * If Android call showDialog and return AlertDialog to show the error and TextButton to dismiss.

void errorDialog(BuildContext context, String errorMessage) {
  if (!Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  } //if (Platform.isIOS)
  else {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        });
  } //else
} // end void errorDialog

import 'package:flutter/material.dart';

class ToastService {
   static void showToast(BuildContext context, String str) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(str),
        action: SnackBarAction(
            label: 'Tamam', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
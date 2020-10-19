import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewUtils {
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}

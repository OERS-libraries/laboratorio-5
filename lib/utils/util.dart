import 'package:example_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';

class Util {


  static void showLoading(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7), child: Text(message)),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: alert);
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<void> showBottomSheet(
      {required BuildContext context, required Widget bottomSheet}) async {
    double _radius = 16;
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_radius),
                        topRight: Radius.circular(_radius))),
                child: SingleChildScrollView(child: bottomSheet)),
          );
        });
  }


  static Size sizeScreen({required BuildContext context}) {
    MediaQueryData queryData = MediaQuery.of(context);
    return queryData.size;
  }

  static Orientation orientationScreen({required BuildContext context}) {
    MediaQueryData queryData = MediaQuery.of(context);
    return queryData.orientation;
  }

  static void longToast({required String msg}) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }

  static void shortToast({required String msg}) {
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT);
  }

  static Widget shimmer({required Widget child}) {
    return Shimmer.fromColors(
        child: child,
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor);
  }

  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

}

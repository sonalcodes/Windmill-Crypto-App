import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstants {
  static String baseUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/";
  static String apiKey = "2592e201-7cb0-41b4-81d5-abacc60ac4ee";

  static Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          print('connected');
        }
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
      //Here you can setState a bool like internetAvailable = false;
      //or use call this before uploading data to firestore/storage depending upon the result, you can move on further.
      return false;
    }
  }

 static void showError({
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 2000));
  }
}
import 'package:flutter/material.dart';

import 'package:get/get.dart';

SnackbarController snackBar(String message, bool isSuccess) {
  if (Get.isSnackbarOpen) Get.back();
  return Get.snackbar('提示:', message,
      backgroundColor: isSuccess
          ? const Color(0xFFe3f2db).withOpacity(0.6)
          : const Color(0xFFE09F9F).withOpacity(0.6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      colorText: isSuccess
          ? const Color(0xFF1A703B).withOpacity(0.9)
          : const Color(0xFFE62315).withOpacity(0.9));
}

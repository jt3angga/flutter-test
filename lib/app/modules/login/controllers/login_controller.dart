import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_test_app/app/helpers/dialog_helper.dart';
import 'package:valbury_test_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  String email = '';
  String password = '';
  
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Harap masukan valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password harus lebih dari 6 characters";
    }
    return null;
  }

  Future<void> checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar('Error', 'Harap masukan Email dan Password dengan benar!',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      
      DialogHelper.showLoading();
      // Simulate Fetch api
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          DialogHelper.hideLoading();
          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }
}

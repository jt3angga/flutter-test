import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_test_app/app/helpers/dialog_helper.dart';
import 'package:valbury_test_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      phoneNumberController,
      passwordController;
  String email = '';
  String phoneNumber = '';
  String password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Harap masukan valid Email";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.length > 10) {
      return "Maksimal 10 digit";
    }

    if (value.length < 8) {
      return "Minimal 8 digit";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password harus lebih dari 6 characters";
    }
    return null;
  }

  Future<void> checkRegister() async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      Get.snackbar('Error', 'Harap masukan Email, No. HP dan Password dengan benar!',
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

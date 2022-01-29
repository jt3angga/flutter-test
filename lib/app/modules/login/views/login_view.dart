import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury_test_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(top: 0, left: 16, right: 16),
            width: context.width,
            height: context.height,
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo.jpeg",
                          width: 150,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Silahkan login untuk melanjutkan",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: controller.passwordController,
                          onSaved: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        ),
                      ],
                    ),
                  ),
                )),
                Container(
                  child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: context.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: Text(
                          "Login",
                          style:
                              TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () {
                          controller.checkLogin();
                        },
                      )
                    ),
                    Container(
                      width: context.width,
                      margin: const EdgeInsets.only(bottom: 5, top: 2),
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: Text(
                          "Klik disini untuk Daftar",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                      ),
                    )
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

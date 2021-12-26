import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(4, 8)),
                    ],
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Sign UP',
                        fontColor: Colors.black,
                        size: 30.0,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      CustomTextFormField(
                        titleText: 'Name',
                        hint: 'Ali Elsayed',
                        onSave: (value) {
                          controller.name = value;
                        },
                        validate: (value) {
                          if (value == '') {
                            return 'Please enter name';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomTextFormField(
                        titleText: 'Email',
                        hint: 'omar2020@gamail.com',
                        onSave: (value) {
                          controller.email = value;
                        },
                        validate: (value) {
                          if (value == '') {
                            return 'Please enter Email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please Enter a valid Email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomTextFormField(
                        titleText: 'Password',
                        hint: '*******',
                        hidePassword: true,
                        onSave: (value) {
                          controller.password = value;
                        },
                        validate: (value) {
                          if (value == '') {
                            return 'Please enter Password';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomTextFormField(
                        titleText: 'Confirm Password',
                        hint: '*******',
                        hidePassword: true,
                        onSave: (value) {
                          controller.confirmedPassword = value;
                        },
                        validate: (value) {
                          if (value == '') {
                            return 'Re_enter your password';
                          }
                          if (controller.password != controller.confirmedPassword) {
                            return ' Password does n\'t match';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomButton(
                        btnText: 'Sign UP',
                        onPress: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            controller.signUpWithEmailPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

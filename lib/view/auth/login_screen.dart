import 'package:e_commerce/view/auth/register_screen.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce/view/widgets/cutom_social_button.dart';
import 'package:e_commerce/view_model/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class LoginScreen extends GetWidget<AuthController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
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
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Welcome,',
                            fontColor: Colors.black,
                            size: 30.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            child: CustomText(
                              text: 'Sign UP',
                              fontColor: kPrimaryColor,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomText(
                        text: 'Sign in to Continue',
                        fontColor: Colors.grey,
                        size: 14.0,
                        alignment: Alignment.topLeft,
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
                          if (value == null) {
                            print('Error');
                          }
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      CustomTextFormField(
                        titleText: 'Password',
                        hint: '*******',
                        onSave: (value) {
                          controller.password = value;
                        },
                        validate: (value) {
                          if (value == null) {
                            print('Error');
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomText(
                        text: 'Forget Password?',
                        fontColor: Colors.black,
                        size: 14.0,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        btnText: 'Sign In',
                        onPress: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            controller.signInWithEmailPassword();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomText(
                text: '-OR-',
                fontColor: Colors.black,
                size: 25.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 25,
              ),
              CustomSocialButton(
                onPress: () {
                  controller.facebookSignInMethod();
                },
                btnTitle: 'Sign in with Facebook',
                imgPath: 'assets/images/face.png',
              ),
              SizedBox(
                height: 25,
              ),
              CustomSocialButton(
                onPress: () {
                  controller.googleSinInMethod();
                },
                btnTitle: 'Sign in with Google',
                imgPath: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

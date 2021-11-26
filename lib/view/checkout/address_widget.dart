import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: kPrimaryColor,
                    size: 28.0,
                  ),
                  SizedBox(width: 5.0),
                  CustomText(
                    text: 'Billing address is the same as delivery address',
                    size: 16.0,
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomTextFormField(
                titleText: 'Street 1',
                hint: '21, Alex Davidson Avenue',
                hintColor: Colors.black87,
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomTextFormField(
                titleText: 'Street 2',
                hint: 'Opposite Omegatron, Vicent Quarters',
                hintColor: Colors.black87,
              ),
              SizedBox(
                height: 40.0,
              ),
              CustomTextFormField(
                titleText: 'City',
                hint: 'Victoria Island',
                hintColor: Colors.black87,
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: CustomTextFormField(
                        titleText: 'State',
                        hint: 'Lagos State',
                        hintColor: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: CustomTextFormField(
                        titleText: 'Country',
                        hint: 'Nigeria',
                        hintColor: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

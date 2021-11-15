import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widgets/custom_auth_button.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Row(
                      children: [
                        Container(
                            width: 130.0,
                            child: Image.asset(
                              'assets/images/watch.png',
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'product name',
                                size: 20.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomText(
                                text: '\$ 1000 ',
                                fontColor: kPrimaryColor,
                                size: 16.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 15.0),
                                    CustomText(
                                      text: '1',
                                      size: 16.0,
                                    ),
                                    SizedBox(width: 15.0),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 15.0),
                                        child: Icon(Icons.minimize)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.0,
                  );
                },
                itemCount: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'TOTAL',
                        fontColor: Colors.grey,
                        size: 15.0,
                      ),
                      SizedBox(height: 5.0,),
                      CustomText(
                        text: '\$2400',
                        fontColor: kPrimaryColor,
                        size: 22.0,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                  Container(
                    width: 150.0,
                    child: CustomButton(
                      btnText: 'CHECKOUT',
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

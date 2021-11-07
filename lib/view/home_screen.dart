import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view_model/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget{
  final List<String> categoriesNames = <String>[
    'men',
    'women',
    'child',
    'women',
    'child'
  ];
  final List<String> bestSellingGoods = <String>[
    'men',
    'women',
    'child',
    'women',
    'child'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 70, right: 13.0, bottom: 13.0, left: 13.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey.shade200),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomText(
                text: 'Categories',
                alignment: Alignment.bottomLeft,
                size: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 150.0,
                // padding: EdgeInsets.all(30.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 80.0,
                          width: 80,
                          child: Image.asset(
                            'assets/images/menShoes.png',
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(4, 8),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomText(
                          text: categoriesNames[index],
                          size: 20.0,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20.0,
                    );
                  },
                  itemCount: categoriesNames.length,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Best Selling',
                    size: 20.0,
                  ),
                  CustomText(
                    text: 'See all',
                    size: 18.0,
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 350.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/watch.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CustomText(
                            text: 'Leather Watch',
                            size: 18.0,
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          CustomText(
                            text: 'Tig Hour',
                            fontColor: Colors.grey,
                            size: 16.0,
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          CustomText(
                            text: '\$144 ',
                            fontColor: kPrimaryColor,
                            size: 18.0,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20.0,
                    );
                  },
                  itemCount: bestSellingGoods.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homController) {
          return BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.black45,
            currentIndex: homController.bottomNavBarCurrentIndex,
            onTap: (index) {
              homController.bottomNavBarCurrentIndex = index;
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Icon_Explore.png'),
                activeIcon: CustomText(
                  text: 'Explore',
                ),
                tooltip: 'Explore',
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Icon_Cart.png'),
                activeIcon: CustomText(
                  text: 'Cart',
                ),
                tooltip: 'Cart',
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Icon_User.png'),
                activeIcon: CustomText(
                  text: 'User',
                ),
                tooltip: 'User Account',
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suvidha_food/constant.dart';
import 'package:suvidha_food/style.dart';

import 'colors.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key key, this.imagePath}) : super(key: key);
  final imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          getCustomAppBar(context),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Primavera Pizza',
                  size: 40,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/dollar.svg',
                      color: AppColors.tertiary,
                      width: 15,
                    ),
                    PrimaryText(
                      height: 1,
                      text: '5.99',
                      color: AppColors.tertiary,
                      size: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'Size',
                            size: 18,
                            color: AppColors.lightGray,
                          ),
                          PrimaryText(
                            text: 'Medium 14"',
                            size: 22,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Crust',
                            size: 18,
                            color: AppColors.lightGray,
                          ),
                          PrimaryText(
                            text: 'Thin Crust',
                            size: 22,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Delivery In',
                            size: 18,
                            color: AppColors.lightGray,
                          ),
                          PrimaryText(
                            text: '30 min',
                            size: 22,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10, color: AppColors.lightGray)
                            ]),
                        child: Hero(
                            tag: imagePath,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 15, top: 50),
            child: PrimaryText(
              text: 'Ingredients',
              size: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: ingredients.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: ingredientCard(ingredients[index]['imagePath']),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryText(
                text: 'Place an order',
                fontWeight: FontWeight.w700,
                size: 18,
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.secondary,
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }

  Widget ingredientCard(String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 10)]),
      child: Image.asset(
        imagePath,
        width: 90,
      ),
    );
  }

  Padding getCustomAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lightGray)),
              child: Icon(Icons.chevron_left_rounded),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.star,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suvidha_food/colors.dart';
import 'package:suvidha_food/constant.dart';
import 'package:suvidha_food/style.dart';

import 'foodDetail.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://i.imgur.com/yv4EkM6.gif'),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/menu.svg'), onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: 'Food',
                    size: 20,
                  ),
                  PrimaryText(
                    text: 'Delivery',
                    size: 42,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search,
                color: AppColors.secondary,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search..',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGray),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lighterGray),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: PrimaryText(
              text: 'Categories',
              fontWeight: FontWeight.w800,
              size: 22,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodCategoryList.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child: foodCategoryCard(foodCategoryList[index]['imagePath'],
                    foodCategoryList[index]['name'], index),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: PrimaryText(
              text: 'Popular',
              fontWeight: FontWeight.w800,
              size: 22,
            ),
          ),
          Column(
            children: List.generate(
                popularFoodList.length,
                (index) => popularFoodCard(
                    context,
                    popularFoodList[index]['name'],
                    popularFoodList[index]['weight'],
                    popularFoodList[index]['imagePath'],
                    popularFoodList[index]['star'])),
          )
        ],
      ),
    );
  }

  Widget popularFoodCard(BuildContext context, String name, String weight,
      String imagePath, String rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(
                      imagePath: imagePath,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 25, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 25),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primary,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        PrimaryText(
                          text: 'Top of the week',
                          size: 16,
                          fontWeight: FontWeight.w500,
                          //color: AppColors.lightGray,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: PrimaryText(
                      text: name,
                      fontWeight: FontWeight.w800,
                      size: 22,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: PrimaryText(
                      text: weight,
                      size: 18,
                      color: AppColors.lightGray,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          PrimaryText(
                            text: rating,
                            fontWeight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(15, 0, 0),
              width: MediaQuery.of(context).size.width * 0.3,
              child: Hero(
                child: Image.asset(imagePath),
                tag: imagePath,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(blurRadius: 20, color: AppColors.lightGray)
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedCard == index ? AppColors.primary : AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 50,
            ),
            PrimaryText(
              text: name,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor:
                  selectedCard == index ? AppColors.white : AppColors.tertiary,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color: selectedCard == index
                    ? AppColors.secondary
                    : AppColors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

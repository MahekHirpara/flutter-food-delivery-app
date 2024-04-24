import 'package:flutter/material.dart';
import 'package:food_app/screen/home/main_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'India',
                        color: AppColors.maincolor,
                      ),
                      Row(
                        children: [
                          SmallText(text: 'Surat'),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Demensions.height45,
                      width: Demensions.width45,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Demensions.radius15),
                        color: AppColors.maincolor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Demensions.iconSize24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(child: MainPageBody())),
        ],
      ),
    );
  }
}

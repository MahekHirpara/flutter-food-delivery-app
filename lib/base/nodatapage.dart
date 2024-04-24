import 'package:flutter/material.dart';
import 'package:food_app/utils/deminstional.dart';
class NoPageData extends StatelessWidget {
  final String text;
  final String imgPath;
  const NoPageData({super.key,required this.text, this.imgPath='assets/images/empty_cart.png'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          height: MediaQuery.sizeOf(context).height*0.22,
          width: MediaQuery.sizeOf(context).width*0.22,
        ),
        SizedBox(height: Demensions.height10 ,),
        Text(text,style: TextStyle(fontSize:MediaQuery.sizeOf(context).height*0.0175, color: Theme.of(context).disabledColor),),
      ],
    );
  }
}

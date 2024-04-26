import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controller/popular_food_controller.dart';
import 'package:food_app/controller/recommended_food_controller.dart';
import 'package:food_app/modal/popular_food_modal.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:food_app/utils/app_const.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/deminstional.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_with_text.dart';
import 'package:food_app/widgets/small_text.dart';
import 'package:get/get.dart';


class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentvalue = 0.0;
  final _scalFactor = 0.8;
  final _height = Demensions.pageViewContainer;
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentvalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopulerFoodController>(
          builder: (popularProduct) {
            print(popularProduct.populerFoodList);
            return popularProduct.isLoaded
                ? SizedBox(
              height: Demensions.pageContainer,
              child: PageView.builder(
                controller: pageController,
                itemCount: popularProduct.populerFoodList.length,
                itemBuilder: (context, positione) {
                  return _buildPageItem(positione,
                      popularProduct.populerFoodList[positione]);
                },
              ),
            )
                : const CircularProgressIndicator();
          },
        ),

        //indecator
        GetBuilder<PopulerFoodController>(
          builder: (popularProduct) {
            return DotsIndicator(
              dotsCount: popularProduct.populerFoodList.isEmpty
                  ? 1
                  : popularProduct.populerFoodList.length,
              position: _currentvalue.toInt(),
              decorator: DotsDecorator(
                activeColor: AppColors.maincolor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            );
          },
        ),

        SizedBox(
          height: Demensions.height30,
        ),
        //populer
        Container(
          margin: EdgeInsets.only(
              left: Demensions.width15, right: Demensions.width25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Populer'),
              SizedBox(
                width: Demensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: Demensions.width5),
                child: BigText(
                  text: '.',
                  color: Colors.black45,
                ),
              ),
              SizedBox(
                width: Demensions.width10,
              ),
              SmallText(text: 'Food Serving'),
            ],
          ),
        ),
        SizedBox(
          height: Demensions.height30,
        ),
        //listView
        GetBuilder<RecommadedFoodController>(
          builder: (recommededProduct) {
            return recommededProduct.isLoaded
                ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommededProduct.recomededproductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(index,'home'));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Demensions.width10,
                        right: Demensions.width10,
                        bottom: Demensions.width10),
                    child: Row(
                      children: [
                        //image
                        Container(
                          height: Demensions.imageContainer,
                          width: Demensions.imageContainer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Demensions.radius15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${AppConstant.BASE_URL}/uploads/' +
                                    recommededProduct
                                        .recomededproductList[index]
                                        .img!),
                              )),
                        ),
                        //textContainer
                        Expanded(
                          child: Container(
                            height: Demensions.listViewTextContainer,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight:
                                Radius.circular(Demensions.radius15),
                                bottomRight:
                                Radius.circular(Demensions.radius15),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFe8e8e8),
                                  blurRadius: 5,
                                  offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Demensions.width10,
                                right: Demensions.width10,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: recommededProduct
                                        .recomededproductList[index].name,
                                  ),
                                  SizedBox(
                                    height: Demensions.height10,
                                  ),
                                  SmallText(text: 'with Indian masala'),
                                  SizedBox(
                                    height: Demensions.height10,
                                  ),
                                  Row(
                                    children: [
                                      const IconwithText(
                                        icon: Icons.circle_sharp,
                                        iconColor: AppColors.iconColor1,
                                        text: 'Normal',
                                      ),
                                      SizedBox(
                                        width: Demensions.width5,
                                      ),
                                      const IconwithText(
                                        icon: Icons.location_on,
                                        iconColor: AppColors.maincolor,
                                        text: '7.3km',
                                      ),
                                      SizedBox(
                                        width: Demensions.width5,
                                      ),
                                      const IconwithText(
                                        icon: Icons
                                            .access_time_filled_rounded,
                                        iconColor: AppColors.iconColor2,
                                        text: '32min',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModal popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentvalue.floor()) {
      var currScale = 1 - (_currentvalue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentvalue.floor() + 1) {
      var currScale =
          _scalFactor + (_currentvalue - index + 1) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentvalue.floor() - 1) {
      var currScale = 1 - (_currentvalue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //image
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index,'home'),);
            },
            child: Container(
              height: Demensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Demensions.width5, right: Demensions.width5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Demensions.radius30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${AppConstant.BASE_URL}/uploads/${popularProduct.img!}'),
                ),
              ),
            ),
          ),
          //textContainer
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Demensions.textContainer,
              margin: EdgeInsets.only(
                  left: Demensions.width25,
                  right: Demensions.width25,
                  bottom: Demensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Demensions.radius30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Demensions.height10,
                    left: Demensions.width10,
                    right: Demensions.width10),
                child: AppColumn(
                  text: popularProduct.name.toString(),
                  rate: popularProduct.stars!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_app/screen/home/main_home_page.dart';
import 'package:food_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex=0;
  List page=[
    const MainFoodPage(),
    Container(child: const Center(child: Text('next page'),),),
    Container(child: const Center(child: Text('next next page'),),),
    Container(child: const Center(child: Text('next next next page'),),)
  ];
  void onTapNav(int index){
  setState(() {
    selectedIndex = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.maincolor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}

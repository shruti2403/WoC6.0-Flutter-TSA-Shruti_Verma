
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_market_trading_app/home_screen.dart';
import 'package:stock_market_trading_app/stocks/stock.dart';
import 'package:stock_market_trading_app/stocks/stocks_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          'img/watchlist.png',
          height: myHeight * 0.03,
        ),
        label: '',
        activeIcon: Image.asset(
          'img/watchlist.png',
          height: myHeight * 0.03,
        ),
      ),

      BottomNavigationBarItem(
        icon: GestureDetector(
          onTap: () => Get.to(() => Stocks()),
          child: Image.asset(
            'img/stocks.jpg',
            height: myHeight * 0.03,
          ),
        ),
        label: '',
        activeIcon: Image.asset(
          'img/stocks.jpg',
          height: myHeight * 0.03,
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'img/news.png',
          height: myHeight * 0.03,
        ),
        label: '',
        activeIcon: Image.asset(
          'img/news.png',
          height: myHeight * 0.03,
        ),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'img/home.png',
          height: myHeight * 0.03,
        ),
        label: '',
        activeIcon: Image.asset(
          'img/home.png',
          height: myHeight * 0.03,
        ),
      ),
    ];

    var navBody = [
      Stocks(),
      Stocks(),
      Container(color: Colors.purple,),
      Container(color: Colors.cyan,),
    ];
    return Scaffold(
      body:Column(
        children: [
          Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: navbarItem,
          onTap: (value) {
            // If you want to navigate when other tabs are tapped, uncomment the following line.
            // Get.to(() => pages[index]);
            controller.currentNavIndex.value = value;          },
        ),
      ),
    );
  }
}

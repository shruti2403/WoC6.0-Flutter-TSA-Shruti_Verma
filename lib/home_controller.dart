import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_trading_app/home_screen.dart';
import 'package:stock_market_trading_app/stocks/stock.dart';
import 'package:stock_market_trading_app/stocks/stocks_controller.dart';
import 'package:stock_market_trading_app/welcome_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    var controller = Get.find<HomeController>(); // Use Get.find() to get the controller

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
      WelcomePage(email: ''),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody[controller.currentNavIndex.value])),
        ],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}

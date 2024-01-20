import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_market_trading_app/signup_page.dart';
import 'package:stock_market_trading_app/stocks/stock.dart';
import 'home.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const Stocks(),
    const Stocks(),
    const Stocks(),
    const Stocks(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            // If you want to navigate when other tabs are tapped, uncomment the following line.
            // Get.to(() => pages[index]);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
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
          ],
        ),
      ),
    );
  }
}

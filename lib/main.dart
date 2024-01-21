import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stock_market_trading_app/auth_controller.dart';
import 'package:stock_market_trading_app/firebase_options.dart';
import 'package:stock_market_trading_app/stocks/list.dart';
import 'package:stock_market_trading_app/stocks/stock.dart';
import 'package:stock_market_trading_app/watchlist.dart';
import 'package:stock_market_trading_app/welcome_page.dart';

import 'home_controller.dart';
import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
        ),
      ),
      home: const Stocks(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: Container(color: Colors.blue))), // Replace with your actual UI
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: Get.find<HomeController>().currentNavIndex.value,
        selectedItemColor: Colors.red,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [],
        onTap: (value) {
          Get.find<HomeController>().currentNavIndex.value = value;
        },
      )),
    );
  }
}

void lazyPutController() {
  Get.lazyPut<HomeController>(() => HomeController());
}

// class HomeNavigationPage extends StatefulWidget {
//   const HomeNavigationPage({Key? key, required this.currentIndex}) : super(key: key);
//
//   late int currentIndex;
//
//   @override
//   _HomeNavigationPageState createState() => _HomeNavigationPageState();
// }

// class _HomeNavigationPageState extends State<HomeNavigationPage> {
//   final screens = [
//     const Watchlist(),
//     const Stocks(),
//     const Stocks(),
//     const WelcomePage(email: ''),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: IndexedStack(
//         index: widget.currentIndex,
//         children: screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: Colors.greenAccent,
//         currentIndex: widget.currentIndex,
//         onTap: (index) {
//           setState(() {
//             widget.currentIndex = index;
//           });
//         },
//         items:  [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'img/watchlist.png',
//               height: h * 0.03,
//             ),
//             label: '',
//             activeIcon: Image.asset(
//               'img/watchlist.png',
//               height: h * 0.03,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap: () => Get.to(() => const Stocks()),
//               child: Image.asset(
//                 'img/stocks.jpg',
//                 height: h * 0.03,
//               ),
//             ),
//             label: '',
//             activeIcon: Image.asset(
//               'img/stocks.jpg',
//               height: h * 0.03,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'img/news.png',
//               height: h * 0.03,
//             ),
//             label: '',
//             activeIcon: Image.asset(
//               'img/news.png',
//               height: h * 0.03,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'img/home.png',
//               height: h * 0.03,
//             ),
//             label: '',
//             activeIcon: Image.asset(
//               'img/home.png',
//               height: h * 0.03,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

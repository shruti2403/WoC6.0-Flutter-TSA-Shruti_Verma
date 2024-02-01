import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:stock_market_trading_app/News/views/home.dart';
import 'package:stock_market_trading_app/Watchlist/favorite_list.dart';
import 'package:stock_market_trading_app/Watchlist/favorite_page.dart';
import 'package:stock_market_trading_app/Watchlist/watchlist.dart';
import 'package:stock_market_trading_app/Watchlist/watchlist_page_models.dart';
import 'package:stock_market_trading_app/auth_controller.dart';
import 'package:stock_market_trading_app/firebase_options.dart';
import 'package:stock_market_trading_app/login_page.dart';
import 'package:stock_market_trading_app/stocks/list.dart';
import 'package:stock_market_trading_app/stocks/stock.dart';
import 'package:stock_market_trading_app/welcome_page.dart';

import 'Watchlist/watch_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoritelist, favoritepage) {
            if (favoritepage == null) {
              throw ArgumentError.notNull('favoritepage');
            }
            favoritepage.favoritelist = favoritelist;
            return favoritepage;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Colors.grey.shade600,
        ),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => FavoriteList(),
        //   '/favoritepage': (context) => FavoritePage(),
        // },

        home: Home(),
      ),
    );
  }
}


class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify email'),
      ),
      body: Column(
        children: [
          Text('Please Verify your Email'),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                await user.sendEmailVerification();
              }
            },
            child: Text('Send Email Verification'),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wind_chat/core/models/model.dart';
import 'package:wind_chat/view/coins_view.dart';
import 'package:wind_chat/view/currency_view.dart';
// import 'package:wind_chat/view/login_view.dart';
// import 'package:wind_chat/view/home_view.dart';
// import 'package:wind_chat/view/messages_view.dart';
// import 'package:wind_chat/view/news.view.dart';
import 'package:wind_chat/view/settings_view.dart';
import 'package:wind_chat/view/stock_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _children = const [
    CoinsView(),
    CurrencyView(),
    // NewsView(),
    // MessagesView(),
    StockView(),
    SettingsView(),
  ];

  void onTabTapped(int index) {
    GlobalModels.navigationIndex.value = index;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _updateSelectedIndex(int index) {
    setState(() {
      GlobalModels.navigationIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   title: const Text(
        //     'Kripto ve Döviz Takibi',
        //     style: TextStyle(
        //       fontWeight: FontWeight.w600,
        //       color: Colors.white,
        //     ),
        //   ),
        //   backgroundColor: Colors.blueGrey[900],
        //   centerTitle: true,
        // ),
        body: _children[GlobalModels.navigationIndex.value],
        bottomNavigationBar: Container(
          color: Colors.blueGrey[900],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GNav(
              backgroundColor: Colors.blueGrey[900] ?? Colors.grey,
              color: Colors.white,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.grey[200] ?? Colors.grey,
              gap: 4,
              onTabChange: onTabTapped,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.currency_bitcoin,
                  text: 'Kripto',
                ),
                GButton(
                  icon: Icons.attach_money,
                  text: 'Döviz',
                ),
                // GButton(
                //   icon: Icons.newspaper,
                //   text: 'Haberler',
                // ),
                GButton(
                  icon: Icons.currency_exchange,
                  text: 'Hisse',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Ayarlar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

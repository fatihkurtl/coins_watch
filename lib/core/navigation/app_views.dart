import 'package:get/get.dart';
// import 'package:wind_chat/view/coin_detail_view.dart';
import 'package:wind_chat/view/coins_view.dart';
// import 'package:wind_chat/core/components/news.view.dart';
import 'package:wind_chat/view/currency_view.dart';
import 'package:wind_chat/view/settings_view.dart';
import 'package:wind_chat/view/stock_view.dart';
import 'routes.dart';
// import 'package:wind_chat/view/home_view.dart';
// import 'package:wind_chat/view/login_view.dart';

abstract class AppViews {
  static final views = [
    GetPage(
      name: Routes.coins,
      page: () => const CoinsView(),
    ),
    GetPage(
      name: Routes.curreny,
      page: () => const CurrencyView(),
    ),
    // GetPage(
    //   name: Routes.coin_detail,
    //   page: () => const CoinDetailView(
    //     coin: null,
    //   ),
    // ),
    // GetPage(
    //   name: Routes.news,
    //   page: () => const NewsView(),
    // ),
    GetPage(
      name: Routes.stock,
      page: () => const StockView(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsView(),
    ),
  ];
}

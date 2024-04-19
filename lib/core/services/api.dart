import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wind_chat/core/constants.dart';

class ApiServices {
  Future<List<Map<String, dynamic>>?> fetchCoinData() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.coinMarketcapAPI), headers: Constants.coinMarketcapHeaders);
      if (response.statusCode == 200) {
        List<dynamic> coinDataList = jsonDecode(response.body)['data'];
        List<Map<String, dynamic>> coinsList = [];

        for (var coinData in coinDataList) {
          Map<String, dynamic> coinMap = {
            'id': coinData['id'],
            'name': coinData['name'],
            'symbol': coinData['symbol'],
            'market_cap_rank': coinData['cmc_rank'],
            'date_added': coinData['date_added'],
            'price': coinData['quote']['USD']['price'],
            'market_cap': coinData['quote']['USD']['market_cap'],
            'volume_24h': coinData['quote']['USD']['volume_24h'],
            'volume_change_24h': coinData['quote']['USD']['volume_change_24h'],
            'last_updated': coinData['quote']['USD']['last_updated'],
          };
          coinsList.add(coinMap);
        }

        return coinsList;
      } else {
        return null;
      }
    } catch (e) {
      print('coinList error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> fetchCurrencyData() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.currencyAPI), headers: Constants.currencyHeaders);
      if (response.statusCode == 200) {
        List<dynamic> currencyDataList = jsonDecode(response.body)['TCMB_AnlikKurBilgileri'];
        List<Map<String, dynamic>> currencyList = [];

        for (var currencyData in currencyDataList) {
          Map<String, dynamic> currencyMap = {
            'currency': utf8.decode(currencyData['Isim'].codeUnits),
            'forex_buying': currencyData['ForexBuying'],
            'forex_selling': currencyData['ForexSelling'],
            'bank_buying': currencyData['BanknoteBuying'],
            'bank_selling': currencyData['BanknoteSelling'],
            'cross_rate_usd': currencyData['CrossRateUSD'] ?? 0.0,
          };
          currencyList.add(currencyMap);
        }

        return currencyList;
      } else {
        return null;
      }
    } catch (e) {
      print('currencyList error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> fetchCurrencySummary() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.CurrencySummaryAPI));
      print('currencySummary: ' + response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> currencySummaryData = jsonDecode(response.body);
        List<Map<String, dynamic>> currencySummaryList = [];
        for (var summary in currencySummaryData['data']) {
          Map<String, dynamic> currencySummaryMap = {
            'symbol_id': summary['SEMBOLID'] ?? 'Unknown',
            'symbol': summary['SEMBOL'] ?? 'Unknown',
            'description': summary['ACIKLAMA'] ?? 'Unknown',
            'percentage_change': summary['YUZDEDEGISIM'] ?? 'Unknown',
            'net': summary['NET'] ?? 'Unknown',
            'date': summary['TARIH'] ?? 'Unknown',
            'high': summary['YUKSEK'] ?? 'Unknown',
            'low': summary['DUSUK'] ?? 'Unknown',
            'yesterday_closing': summary['DUNKUKAPANIS'] ?? 'Unknown',
            'opening': summary['ACILIS'] ?? 'Unknown',
            'closing': summary['KAPANIS'] ?? 'Unknown',
            'buying': summary['ALIS'] ?? 'Unknown',
            'selling': summary['SATIS'] ?? 'Unknown',
            'volume': summary['HACIMTL'] ?? 'Unknown',
            'order_id': summary['OrderId'] ?? 'Unknown',
            'date_format': summary['TARIHFORMAT'] ?? 'Unknown',
          };
          currencySummaryList.add(currencySummaryMap);
        }
        return currencySummaryList;
      } else {
        return null;
      }
    } catch (e) {
      print('currencySummary error: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> fetchNewsData() async {
    try {
      http.Response response = await http.get(Uri.parse('${Constants.coinGeckoAPI}/news'));
      print('news coin' + response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> newsDataList = jsonDecode(response.body);
        List<Map<String, dynamic>> newsData = [];
        for (var news in newsDataList['data']) {
          Map<String, dynamic> newsItem = {
            'author': news['author'] ?? 'Unknown',
            'title': news['title'] ?? 'Unknown',
            'news_site': news['news_site'] ?? 'Unknown',
            'url': news['url'],
            'thumb_2x': news['thumb_2x'],
            'updated_at': news['updated_at'] ?? 0,
          };
          newsData.add(newsItem);
        }
        return newsData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

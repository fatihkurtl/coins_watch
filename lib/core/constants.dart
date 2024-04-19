class Constants {
  static String binanceCoinAPI = 'https://api.binance.com/api/v3/ticker/price';
  static String coinMarketcapAPI = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';
  static Map<String, String> coinMarketcapHeaders = {
    'X-CMC_PRO_API_KEY': 'fcc9056a-2f8f-48dc-8b0d-68c992c46b13',
  };
  static String coinGeckoAPI = 'https://api.coingecko.com/api/v3';
  static String newsAPI = 'https://api.coingecko.com/api/v3/news';
  static String currencyAPI = 'http://hasanadiguzel.com.tr/api/kurgetir';
  static Map<String, String> currencyHeaders = {
    // 'Content-Type': 'application/json',
    'Accept': 'application/json; charset=utf-8',
  };
  static String CurrencySummaryAPI = 'https://api.bigpara.hurriyet.com.tr/doviz/headerlist/anasayfa';
}

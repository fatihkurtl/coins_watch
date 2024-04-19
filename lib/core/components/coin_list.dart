import 'package:flutter/material.dart';
import 'package:wind_chat/core/services/api.dart';
import 'package:wind_chat/view/coin_detail_view.dart';
import 'package:intl/intl.dart';

class CoinList extends StatefulWidget {
  const CoinList({Key? key});

  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<dynamic>? coins;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ApiServices api = ApiServices();
    List<Map<String, dynamic>>? data = await api.fetchCoinData();
    print('coinData: $data');
    if (data != null) {
      setState(() {
        coins = data;
        print('coinsData: $coins');
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return coins != null
        ? ListView.builder(
            itemCount: coins!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoinDetailView(
                        coin: coins![index],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 20.0,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[700],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          coins![index]['symbol'].toString().toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            NumberFormat.compactCurrency(
                              decimalDigits: 2,
                              symbol: '\$',
                            ).format(
                              coins![index]['price'],
                            ),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$${coins![index]['market_cap'] > 1000000000 ? (coins![index]['market_cap'] / 1000000000).toStringAsFixed(2) + 'B' : (coins![index]['market_cap'] / 1000000).toStringAsFixed(2) + 'M'}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
  }
}

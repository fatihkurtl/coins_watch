import 'package:flutter/material.dart';
import 'package:wind_chat/core/services/api.dart';
import 'package:wind_chat/view/currency_detail.view.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key});

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  List<dynamic>? currencies;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ApiServices api = ApiServices();
    List<Map<String, dynamic>>? data = await api.fetchCurrencyData();
    print('moneyData: $data');
    if (data != null) {
      setState(() {
        currencies = data;
        print('coinsData: $currencies');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return currencies != null
        ? ListView.builder(
            itemCount: currencies!.length,
            itemBuilder: (context, index) {
              // Check if forex_selling value is not null or empty
              if (currencies![index]['forex_selling'] != null && currencies![index]['forex_selling'] != '') {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrencyDetail(
                          currency: currencies![index],
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
                      children: [
                        Expanded(
                          child: Text(
                            currencies![index]['currency'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Text(
                          currencies![index]['forex_selling'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // Return an empty Container if forex_selling is null or empty
                return Container();
              }
            },
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
  }
}

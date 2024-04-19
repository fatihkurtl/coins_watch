import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDetailView extends StatefulWidget {
  final dynamic coin;

  const CoinDetailView({super.key, required this.coin});

  @override
  _CoinDetailViewState createState() => _CoinDetailViewState();
}

class _CoinDetailViewState extends State<CoinDetailView> {
  late dynamic coin;

  @override
  void initState() {
    super.initState();
    coin = widget.coin;
  }

  String formatNumber(dynamic number) {
    if (number is String) {
      number = double.parse(number);
    }

    if (number.abs() >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(2)} T'; // Trilyon
    } else if (number.abs() >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(2)} B'; // Milyar
    } else if (number.abs() >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(2)} M'; // Milyon
    } else if (number.abs() >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(2)} K'; // Bin
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${coin['name'].toUpperCase()} Detayları',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundImage: NetworkImage(coin['image']),
                    // ),
                    const SizedBox(height: 20),
                    Text(
                      '${coin['symbol']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      NumberFormat.compactCurrency(
                        decimalDigits: 5,
                        symbol: '\$',
                      ).format(coin['price']),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _buildInfoCard('Piyasa Değeri Sıralaması', '${coin['market_cap_rank']}. Sıra'),
              _buildInfoCard('Piyasa Değeri', '\$${formatNumber(coin['market_cap'])}'),
              _buildInfoCard('24s Hacim', '\$${formatNumber(coin['volume_24h'])}'),
              _buildInfoCard('24s Hacim Değişimi', '${coin['volume_change_24h']}%'),
              _buildInfoCard('CMC Eklenme Tarihi', coin['date_added'].toString().split('T')[0]),
              _buildInfoCard('Son Güncelleme', coin['last_updated'].toString().split('T').join(' ').split('.')[0]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle) {
    return Card(
      color: Colors.blueGrey[800],
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

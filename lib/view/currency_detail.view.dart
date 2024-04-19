import 'package:flutter/material.dart';

class CurrencyDetail extends StatefulWidget {
  final dynamic currency;
  const CurrencyDetail({super.key, required this.currency});

  @override
  _CurrencyDetailState createState() => _CurrencyDetailState();
}

class _CurrencyDetailState extends State<CurrencyDetail> {
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
          '${widget.currency['currency'].toUpperCase()} Detayları',
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
                    const SizedBox(height: 20),
                    Text(
                      '${widget.currency['currency']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.currency['forex_buying']}',
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
              _buildInfoCard('Döviz Alış', widget.currency['forex_buying'].toString()),
              _buildInfoCard('Döviz Satış', widget.currency['forex_selling'].toString()),
              _buildInfoCard('Banka Alış', widget.currency['bank_buying'].toString()),
              _buildInfoCard('Banka Satış', widget.currency['bank_selling'].toString()),
              if (widget.currency['cross_rate_usd'] != '')
                _buildInfoCard(
                  'Çapraz Kur USD',
                  widget.currency['cross_rate_usd'].toString(),
                ),
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
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
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

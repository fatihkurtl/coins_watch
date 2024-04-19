import 'package:flutter/material.dart';

class SummaryDetail extends StatefulWidget {
  final dynamic summary;
  const SummaryDetail({super.key, required this.summary});

  @override
  _SummaryDetailState createState() => _SummaryDetailState();
}

class _SummaryDetailState extends State<SummaryDetail> {
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
          '${widget.summary['symbol'].toUpperCase()} Detayları',
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
                      '${widget.summary['symbol']}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.summary['description']}',
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
              _buildInfoCard('Alış', widget.summary['buying'].toString()),
              _buildInfoCard('Satış', widget.summary['selling'].toString()),
              _buildInfoCard('En yüksek', widget.summary['high'].toString()),
              _buildInfoCard('En düşük', widget.summary['low'].toString()),
              _buildInfoCard('Açılış', widget.summary['opening'].toString()),
              _buildInfoCard('Kapanış', widget.summary['closing'].toString()),
              _buildInfoCard('Dünkü Kapanış', widget.summary['yesterday_closing'].toString()),
              _buildInfoCard('Hacim', widget.summary['volume'] == 0.0 ? 'N/A' : widget.summary['volume'].toString()),
              _buildInfoCard('Değişim', widget.summary['percentage_change'].toString()),
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
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

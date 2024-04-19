import 'package:flutter/material.dart';
import 'package:wind_chat/core/components/currency_list.dart';
import 'package:wind_chat/core/components/currency_summary.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({super.key});

  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // AppBar yüksekliğini ayarlayın
        child: AppBar(
          backgroundColor: Colors.blueGrey[900],
          bottom: TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontFamily: 'Nunito',
            ),
            indicatorColor: Colors.blueAccent[400],
            indicatorWeight: 4, // TabBar altındaki gösterge çizgisinin kalınlığını ayarlayın
            dividerColor: Colors.blueGrey[900],
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            tabs: const [
              Tab(
                icon: Icon(Icons.attach_money, color: Colors.white),
                text: 'Döviz Kurları',
              ),
              Tab(
                icon: Icon(Icons.account_balance, color: Colors.white),
                text: 'Piyasa Geneli',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[800],
      body: TabBarView(
        controller: _tabController,
        children: const [
          CurrencyList(),
          CurrencySummary(),
        ],
      ),
    );
  }
}

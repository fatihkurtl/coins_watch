import 'package:flutter/material.dart';
import 'package:wind_chat/core/components/coin_list.dart';
import 'package:wind_chat/core/components/news.view.dart';

class CoinsView extends StatefulWidget {
  const CoinsView({Key? key}) : super(key: key);

  @override
  _CoinsViewState createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> with SingleTickerProviderStateMixin {
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
                icon: Icon(Icons.currency_bitcoin, color: Colors.white),
                text: 'Kripto Paralar',
              ),
              Tab(
                icon: Icon(Icons.newspaper, color: Colors.white),
                text: 'Kripto Haberler',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[800],
      body: TabBarView(
        controller: _tabController,
        children: const [
          CoinList(),
          NewsView(),
        ],
      ),
    );
  }
}

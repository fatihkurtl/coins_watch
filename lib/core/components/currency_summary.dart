import 'package:flutter/material.dart';
import 'package:wind_chat/core/services/api.dart';
import 'package:wind_chat/view/summary_detail.dart';

class CurrencySummary extends StatefulWidget {
  const CurrencySummary({super.key});

  @override
  _CurrencySummaryState createState() => _CurrencySummaryState();
}

class _CurrencySummaryState extends State<CurrencySummary> {
  List<Map<String, dynamic>>? summary;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ApiServices api = ApiServices();
    List<Map<String, dynamic>>? data = await api.fetchCurrencySummary();
    print('summaryData: $data');
    if (data != null) {
      setState(() {
        summary = data;
        print('summaryData: $summary');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return summary != null
        ? ListView.builder(
            itemCount: summary!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryDetail(
                        summary: summary![index],
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.blueGrey[700],
                  elevation: 5.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sembol: ${summary![index]['symbol']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Açıklama: ${summary![index]['description']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Yüzde Değişim: ${summary![index]['percentage_change']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Net: ${summary![index]['net']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
  }
}

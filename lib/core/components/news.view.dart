import 'package:flutter/material.dart';
import 'package:wind_chat/core/services/api.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  List<Map<String, dynamic>>? news;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    ApiServices api = ApiServices();
    try {
      dynamic data = await api.fetchNewsData();
      if (data != null) {
        setState(() {
          news = data;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veri alınırken bir hata oluştu')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return news != null
        ? ListView.builder(
            itemCount: news!.length,
            itemBuilder: (context, index) {
              DateTime updatedAt = DateTime.fromMillisecondsSinceEpoch(news![index]['updated_at'] * 1000);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blueGrey[700],
                  child: ListTile(
                    leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: news![index]['thumb_2x'] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                news![index]['thumb_2x'],
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            )
                          : const Icon(Icons.error, color: Colors.red, size: 50),
                    ),
                    title: Text(
                      news![index]['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '${news![index]['news_site']} - ${updatedAt.day}/${updatedAt.month}/${updatedAt.year}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                    ),
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

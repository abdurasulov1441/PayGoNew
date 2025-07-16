import 'package:flutter/material.dart';
import 'package:paygo/services/style/app_colors.dart';

class UserNewsPage extends StatelessWidget {
  const UserNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> fakeNews = [
      {
        'title': '🚛 Новый тариф для грузоперевозок',
        'subtitle': 'Теперь доставка по городу дешевле на 20%',
        'image': 'https://picsum.photos/400/200?1',
      },
      {
        'title': '🔥 Рекламное объявление',
        'subtitle': 'Размести свою рекламу здесь. Узнаваемость 100%',
        'image': 'https://picsum.photos/400/200?2',
      },
      {
        'title': '📦 Обновления в приложении',
        'subtitle': 'Теперь можно отслеживать водителя в реальном времени.',
        'image': 'https://picsum.photos/400/200?3',
      },
      {
        'title': '🎉 Специальная акция до конца месяца',
        'subtitle': 'Закажи 5 доставок и получи 6-ю бесплатно!',
        'image': 'https://picsum.photos/400/200?4',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости и объявления'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: AppColors.ui,
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: fakeNews.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final news = fakeNews[index];
          return Card(
            color: AppColors.backgroundColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    news['image']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        news['subtitle']!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OrderTruck extends StatelessWidget {
  const OrderTruck({super.key});

  @override
  Widget build(BuildContext context) {
    // Statik yuk ma'lumotlari
    final List<Map<String, dynamic>> yukList = [
      {
        'id': 'YUK001',
        'qayerdan': 'Toshkent',
        'qayerga': 'Samarqand',
        'jonashVaqti': '2025-07-28 08:00',
        'yetkazishVaqti': '2025-07-28 14:00',
        'narx': 1200000.00,
        'yukNomi': 'Elektronika',
        'ogirlik': '500 kg',
        'olchamlar': '2m x 1.5m x 1m',
        'turi': 'Nozik',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK002',
        'qayerdan': 'Buxoro',
        'qayerga': 'Xiva',
        'jonashVaqti': '2025-07-28 09:00',
        'yetkazishVaqti': '2025-07-28 16:00',
        'narx': 1500000.00,
        'yukNomi': 'Mebel',
        'ogirlik': '800 kg',
        'olchamlar': '3m x 2m x 1.5m',
        'turi': 'Nozik emas',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK003',
        'qayerdan': 'Andijon',
        'qayerga': 'Farg‘ona',
        'jonashVaqti': '2025-07-28 07:00',
        'yetkazishVaqti': '2025-07-28 12:00',
        'narx': 800000.00,
        'yukNomi': 'To‘qimachilik',
        'ogirlik': '300 kg',
        'olchamlar': '1.5m x 1m x 0.8m',
        'turi': 'Yumshoq mahsulotlar',
        'holat': 'Band qilingan',
      },
      {
        'id': 'YUK004',
        'qayerdan': 'Namangan',
        'qayerga': 'Qo‘qon',
        'jonashVaqti': '2025-07-28 10:00',
        'yetkazishVaqti': '2025-07-28 15:00',
        'narx': 600000.00,
        'yukNomi': 'Mashina qismlari',
        'ogirlik': '1000 kg',
        'olchamlar': '2.5m x 1.8m x 1.2m',
        'turi': 'Og‘ir',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK005',
        'qayerdan': 'Nukus',
        'qayerga': 'Urganch',
        'jonashVaqti': '2025-07-29 06:00',
        'yetkazishVaqti': '2025-07-29 11:00',
        'narx': 900000.00,
        'yukNomi': 'Tibbiy jihozlar',
        'ogirlik': '200 kg',
        'olchamlar': '1m x 1m x 0.5m',
        'turi': 'Nozik',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK006',
        'qayerdan': 'Qarshi',
        'qayerga': 'Termiz',
        'jonashVaqti': '2025-07-28 11:00',
        'yetkazishVaqti': '2025-07-29 17:00',
        'narx': 1300000.00,
        'yukNomi': 'Oziq-ovqat',
        'ogirlik': '600 kg',
        'olchamlar': '2m x 1.2m x 1m',
        'turi': 'Tez buziladigan',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK007',
        'qayerdan': 'Jizzax',
        'qayerga': 'Guliston',
        'jonashVaqti': '2025-07-28 08:30',
        'yetkazishVaqti': '2025-07-28 13:00',
        'narx': 1100000.00,
        'yukNomi': 'Qurilish materiallari',
        'ogirlik': '1200 kg',
        'olchamlar': '3m x 2m x 1.5m',
        'turi': 'Og‘ir',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK008',
        'qayerdan': 'Navoiy',
        'qayerga': 'Zarafshon',
        'jonashVaqti': '2025-07-28 07:30',
        'yetkazishVaqti': '2025-07-28 14:00',
        'narx': 700000.00,
        'yukNomi': 'Kiyim-kechak',
        'ogirlik': '250 kg',
        'olchamlar': '1.2m x 1m x 0.7m',
        'turi': 'Yumshoq mahsulotlar',
        'holat': 'Band qilingan',
      },
      {
        'id': 'YUK009',
        'qayerdan': 'Sirdaryo',
        'qayerga': 'Yangiyer',
        'jonashVaqti': '2025-07-28 09:30',
        'yetkazishVaqti': '2025-07-28 12:30',
        'narx': 650000.00,
        'yukNomi': 'Avtomobil qismlari',
        'ogirlik': '700 kg',
        'olchamlar': '2m x 1.5m x 1m',
        'turi': 'Og‘ir',
        'holat': 'Mavjud',
      },
      {
        'id': 'YUK010',
        'qayerdan': 'Chirchiq',
        'qayerga': 'Angren',
        'jonashVaqti': '2025-07-28 08:00',
        'yetkazishVaqti': '2025-07-28 11:00',
        'narx': 550000.00,
        'yukNomi': 'Kitoblar',
        'ogirlik': '400 kg',
        'olchamlar': '1.5m x 1m x 0.8m',
        'turi': 'Nozik emas',
        'holat': 'Mavjud',
      },
    ];

    // Filtr oynasini ko‘rsatish funksiyasi
    void showFilterBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Yuklarni Filtrlash',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Qayerdan',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Qayerga',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Maksimal Narx',
                    border: OutlineInputBorder(),
                    prefixText: 'so‘m ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Yuk Turi',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      [
                            'Hammasi',
                            'Nozik',
                            'Nozik emas',
                            'Tez buziladigan',
                            'Og‘ir',
                            'Yumshoq mahsulotlar',
                          ]
                          .map(
                            (turi) => DropdownMenuItem(
                              value: turi,
                              child: Text(turi),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Holati',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Hammasi', 'Mavjud', 'Band qilingan']
                      .map(
                        (holat) =>
                            DropdownMenuItem(value: holat, child: Text(holat)),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Oynani yopish
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Qabul qilish',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk Buyurtma Qilish'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showFilterBottomSheet(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: yukList.length,
        itemBuilder: (context, index) {
          final yuk = yukList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yuk['id'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${yuk['narx'].toStringAsFixed(0)} so‘m',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${yuk['qayerdan']} → ${yuk['qayerga']}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text("Jo‘nash: ${yuk['jonashVaqti']}"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_shipping,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text("Yetkazish: ${yuk['yetkazishVaqti']}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Yuk: ${yuk['yukNomi']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Og‘irlik: ${yuk['ogirlik']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "O‘lchamlar: ${yuk['olchamlar']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Turi: ${yuk['turi']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Holati: ${yuk['holat']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Band qilish'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

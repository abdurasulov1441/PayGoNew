import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';

class SearchTruckPage extends StatefulWidget {
  const SearchTruckPage({super.key});

  @override
  State<SearchTruckPage> createState() => _SearchTruckPageState();
}

class _SearchTruckPageState extends State<SearchTruckPage> {
  final MapController _mapController = MapController();
  final LatLng tashkentCenter = LatLng(41.311081, 69.240562);
  double _zoom = 12.0;

  final List<Map<String, dynamic>> trucks = List.generate(2, (index) {
    return {
      "id": index,
      "name": "Грузовик #${index + 1}",
      "position": LatLng(41.311081 + index * 0.01, 69.240562 + index * 0.01),
      "phone": "+99890123456$index",
      "driver": "Водитель #$index",
      "type": "Крупногабаритный",
      "experience": "${2 + index} года",
    };
  });

  void _showTruckDetails(Map<String, dynamic> truck) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              truck['name'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Тип: ${truck['type']}"),
            Text("Водитель: ${truck['driver']}"),
            Text("Опыт: ${truck['experience']}"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.local_shipping),
                    label: const Text("Сделать заказ"),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Заказ оформлен")),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.phone),
                    label: const Text("Позвонить"),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("📞 ${truck['phone']}")),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied)
      return;

    Position position = await Geolocator.getCurrentPosition();
    final userLocation = LatLng(position.latitude, position.longitude);

    _mapController.move(userLocation, _zoom);
  }

  void _zoomIn() {
    setState(() {
      _zoom += 1;
      _mapController.move(_mapController.camera.center, _zoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoom -= 1;
      _mapController.move(_mapController.camera.center, _zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.backgroundColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.grade1,
        title: Text(
          "Yuk mashinalar qidirish",
          style: AppStyle.fontStyle.copyWith(
            fontSize: 20,
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: tashkentCenter,
              initialZoom: _zoom,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'uz.paygo',
              ),
              MarkerLayer(
                markers: trucks.map((truck) {
                  return Marker(
                    point: truck["position"],
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () => _showTruckDetails(truck),
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grade1,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: _zoomIn,
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grade1,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: _zoomOut,
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.grade1,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: _goToCurrentLocation,
                icon: const Icon(
                  Icons.my_location,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

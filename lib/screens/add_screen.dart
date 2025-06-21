import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final List<Map<String, dynamic>> crops = [
    {
      'name': 'Rice',
      'image': 'https://media.istockphoto.com/id/872343048/photo/raw-rice-grain-and-dry-rice-plant-on-wooden-table.jpg?s=1024x1024&w=is&k=20&c=D-Sh9CMlxIssUlqv77fp-Wy5lg3xQANowjJXoIk2Zqc=',
      'info': '🌾 Needs warm temperatures (20–35°C), high humidity, and flooded fields.'
    },
    {
      'name': 'Tomato',
      'image': 'https://cdn.pixabay.com/photo/2015/08/07/15/18/tomatoes-879441_1280.jpg',
      'info': '🍅 Requires 21–27°C, full sun, and well-drained soil.'
    },
    {
      'name': 'Wheat',
      'image': 'https://cdn.pixabay.com/photo/2017/07/17/18/13/wheat-2513272_1280.jpg',
      'info': '🌾 Best in cool climates (10–25°C) with moderate rainfall and dry harvesting season.'
    },
    {
      'name': 'Corn',
      'image': 'https://cdn.pixabay.com/photo/2015/05/26/17/42/pop-corn-785074_1280.jpg',
      'info': '🌽 Prefers 18–27°C, deep fertile soil, and consistent watering.'
    },
    {
      'name': 'Potato',
      'image': 'https://cdn.pixabay.com/photo/2013/09/06/16/00/potatoes-179471_1280.jpg',
      'info': '🥔 Needs cool temperatures (15–20°C), loose soil, and consistent moisture.'
    },
    {
      'name': 'Lettuce',
      'image': 'https://cdn.pixabay.com/photo/2018/06/17/14/45/salad-3480649_1280.jpg',
      'info': '🥬 Thrives in cooler weather (10–20°C), needs moist, well-drained soil.'
    },
    {
      'name': 'Carrot',
      'image': 'https://cdn.pixabay.com/photo/2016/08/03/01/09/carrot-1565597_1280.jpg',
      'info': '🥕 Grows best at 15–20°C, in deep, loose soil with good drainage.'
    },
    {
      'name': 'Chili',
      'image': 'https://cdn.pixabay.com/photo/2019/06/25/18/53/pepperoni-4298825_1280.jpg',
      'info': '🌶 Needs warm temperatures (20–30°C), sunny locations, and moderate water.'
    },
  ];

  void _showCropInfo(BuildContext context, String cropName, String info) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(cropName),
        content: Text(info),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: crops.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final crop = crops[index];
            return GestureDetector(
              onTap: () => _showCropInfo(context, crop['name'], crop['info']),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: Color(0xFF203A43).withOpacity(0.6),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        crop['image'],
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        crop['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

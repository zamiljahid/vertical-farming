import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

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

  int currentPage = 0;

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
    final titles = crops.map((crop) => crop['name'] as String).toList();

    final cards = List.generate(crops.length, (index) {
      final crop = crops[index];
      final isActive = index == currentPage;

      return Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    crop['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              if (isActive)
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          crop['name'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Text(
                              crop['info'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                )
              else
                SizedBox(),
            ],
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: VerticalCardPager(
        titles: titles,
        images: cards,
        textStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onPageChanged: (page) {
          setState(() {
            currentPage = (page ?? 0).toInt();
          });
        },
        onSelectedItem: (index) {
          final crop = crops[index];
          _showCropInfo(context, crop['name'], crop['info']);
        },
      ),
    );
  }
}

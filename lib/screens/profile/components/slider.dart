import 'package:binder_application/screens/profile/buying_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderCustom extends StatefulWidget {
  const SliderCustom({Key? key}) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderCustom> {
  final _imageList = [
    {
      "id": 1,
      "image_path": "assets/images/banner1.jpeg",
      "title": "Buy Super Like",
      "subTitle":
          "Unlimited likes. No ads. See who likes you.\n5 super likes per week.",
      "color": 0xFF1E88E5 // Màu blue
    },
    {
      "id": 2,
      "image_path": "assets/images/banner2.jpg",
      "title": "Buy Higher Speed",
      "subTitle":
          "Unlimited likes. No ads. See who likes you.\n5 super likes per week.",
      "color": 0xFFE53935 // Màu red
    },
    {
      "id": 3,
      "image_path": "assets/images/banner3.jpg",
      "title": "Buy Binder Gold",
      "subTitle":
          "Unlimited likes. No ads. See who likes you.\n5 super likes per week.",
      "color": 0xFF43A047 // Màu green
    },
  ];

  final _carouseController = CarouselController();
  int currentIndex = 0;

  void _changeScreen(
      String title, String subTitle, int color, int id, String imagePath) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BuyingScreen(
                  title: title,
                  color: color,
                  imagePath: imagePath,
                  id: id,
                  subTitle: subTitle,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final title = _imageList[currentIndex]['title'].toString();
    final color = int.parse(_imageList[currentIndex]['color'].toString());
    final id = int.parse(_imageList[currentIndex]['id'].toString());
    final imagePath = _imageList[currentIndex]['image_path'].toString();
    final subTitle = _imageList[currentIndex]['subTitle'].toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: id,
                child: GestureDetector(
                  onTap: () =>
                      _changeScreen(title, subTitle, color, id, imagePath),
                  child: CarouselSlider(
                    carouselController: _carouseController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    items: _imageList
                        .map((e) => Image.asset(
                              e['image_path'].toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ))
                        .toList(),
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _imageList.asMap().entries.map((e) {
                      return GestureDetector(
                        child: Container(
                          width: currentIndex == e.key ? 17 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == e.key
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      );
                    }).toList(),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () =>
                _changeScreen(title, subTitle, color, id, imagePath),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(color),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Thiết lập radius là 25
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 20 / 2, horizontal: 20.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

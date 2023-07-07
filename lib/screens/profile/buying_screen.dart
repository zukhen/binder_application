import 'package:binder_application/text.dart';
import 'package:flutter/material.dart';

class BuyingScreen extends StatefulWidget {
  final String title;
  final int color;
  final String subTitle;
  final int id;
  final String imagePath;

  const BuyingScreen(
      {Key? key,
      required this.title,
      required this.color,
        required this.id,
        required this.imagePath,
        required this.subTitle})
      : super(key: key);

  @override
  State<BuyingScreen> createState() => _BuyingScreenState();
}

class _BuyingScreenState extends State<BuyingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(widget.color),
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.subTitle,
                style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Hero(tag: widget.id, child: Image.asset(widget.imagePath)),
              SizedBox(height: 10,),
              Text(lorem),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(widget.color),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Thiết lập radius là 25
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20 / 2, horizontal: 20.0),
                    child: Text("Buying"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

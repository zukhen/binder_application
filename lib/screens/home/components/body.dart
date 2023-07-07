import 'package:flutter/material.dart';

import '../../../models/users.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int defaultIndex = 0;
  int positionPerson = 0;
  bool isBack = false;
  late User user;

  void _nextImage() {
    setState(() {
      defaultIndex++;
      if (defaultIndex >= user.imageUrls.length) defaultIndex = 0;
    });
  }

  void _swipeRight() {
    setState(() {
      positionPerson++;
      isBack = true;
      if (positionPerson >= User.users.length) {
        defaultIndex = 0;
        positionPerson = 0;
        isBack = false;
      }
      print(">>>>>>>SWIPE RIGHT: $positionPerson");
      user = User.users[positionPerson];
    });
  }

  void _undo() {
    setState(() {
      if (positionPerson > 0) {
        positionPerson--;
        defaultIndex = 0;
        isBack = positionPerson > 0; // Cập nhật giá trị của isBack
        user = User.users[positionPerson];
      }
    });
    print(">>>>>>>BACK PERSON: $positionPerson");
  }


  @override
  Widget build(BuildContext context) {
    user = User.users[positionPerson];

    return GestureDetector(
      onTap: _nextImage,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.network(
              user.imageUrls[defaultIndex],
              height: double.infinity,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(1)],
                  stops: [0.6, 1],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 10),
                        child: Text(
                          user.status,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.age.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      user.bio,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isBack ? Colors.yellow : Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            enableFeedback: isBack,
                              onPressed: _undo,
                              icon: Icon(
                                Icons.undo,
                                color: isBack ? Colors.yellow : Colors.grey,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                              onPressed: _swipeRight,
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                              onPressed: _swipeRight,
                              icon: const Icon(
                                Icons.star,
                                color: Colors.green,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                              onPressed: _swipeRight,
                              icon: const Icon(
                                Icons.bolt,
                                color: Colors.blue,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                              onPressed: _swipeRight,
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.purple,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

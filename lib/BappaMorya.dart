import 'package:flutter/material.dart';

class BappaMorya extends StatefulWidget {
  const BappaMorya({Key? key}) : super(key: key);

  @override
  State<BappaMorya> createState() => _BappaMoryaState();
}

class _BappaMoryaState extends State<BappaMorya> {
  final List<String> images = [
    'assets/img.png',
    'assets/img_1.png',
    'assets/img_2.png'
  ];

  // Current index of the image to display
  int currentIndex = 0;

  // Function to change image on tap
  void changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: changeImage,
          child: Container(
            width: 360,
            height: 300,
            child: Stack(
              children: [
                /// Bottommost Container
                AnimatedPositioned(
                  height: currentIndex == 2 ? 200 : 300,
                  width: currentIndex == 2 ? 200 : 300,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 2 ? 0 : 60,
                  top: currentIndex == 2 ? 55 : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 2 ? 0.25 : 1,
                    child: Image.asset(images[(currentIndex + 2) % images.length]),
                  ),
                ),
                /// Middle Container
                AnimatedPositioned(
                  height: currentIndex == 1 ? 250 : 300,
                  width: currentIndex == 1 ? 250 : 300,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 1 ? 30 : 60,
                  top: currentIndex == 1 ? 30 : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 1 ? 0.50 : 1,
                    child: Image.asset(images[(currentIndex + 1) % images.length]),
                  ),
                ),
                /// Uppermost Container
                AnimatedPositioned(
                  height: currentIndex == 0 ? 300 : 200,
                  width: currentIndex == 0 ? 300 : 200,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 0 ? 60 : 30,
                  top: currentIndex == 0 ? 0 : 30,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 0 ? 1 : 0.25,
                    child: Image.asset(images[currentIndex]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

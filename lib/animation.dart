import 'package:flutter/material.dart';

class AnimationEg extends StatefulWidget {
  const AnimationEg({super.key});

  @override
  State<AnimationEg> createState() => _AnimationEgState();
}

class _AnimationEgState extends State<AnimationEg> {
  // List of image paths
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
        title: const Text('Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: changeImage,
          child: SizedBox(
            width: 360,
            height: 300,
            child: Stack(
              children: [
                Positioned(
                  height: 200,
                  width: 200,
                  left: 0,
                  top: 55,
                  child: AnimatedOpacity(
                    curve: Curves.easeInOutQuint,
                    opacity: 0.25,
                    duration: const Duration(seconds: 5),
                    key: ValueKey<int>(currentIndex),
                    child:
                        Image.asset(images[(currentIndex + 2) % images.length]),
                  ),
                ),
                Positioned(
                  height: 250,
                  width: 250,
                  top: 30,
                  left: 30,
                  child: AnimatedOpacity(
                    curve: Curves.easeInOutQuint,
                    opacity: 0.5,
                    duration: const Duration(seconds: 5),
                    key: ValueKey<int>(currentIndex),
                    child:
                        Image.asset(images[(currentIndex + 1) % images.length]),
                  ),
                ),
                Positioned(
                  height: 300,
                  width: 300,
                  top: 0,
                  right: 0,
                  child: AnimatedOpacity(
                      curve: Curves.easeInOutQuint,
                      opacity: 1,
                      duration: const Duration(seconds: 5),
                      key: ValueKey<int>(currentIndex),
                      child: Image.asset(images[currentIndex])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
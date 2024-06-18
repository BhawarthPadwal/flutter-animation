import 'package:flutter/material.dart';

class TrialTwo extends StatefulWidget {
  const TrialTwo({super.key});

  @override
  State<TrialTwo> createState() => _TrialTwoState();
}

class _TrialTwoState extends State<TrialTwo> {
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              border: Border.all(color: Colors.black)
            ),
            width: 360,
            height: 300,
            child: Stack(
              children: [
                AnimatedPositioned(
                  height: currentIndex == 0 ? 300 : 250,
                  width: currentIndex == 0 ? 300 : 250,
                  left: currentIndex == 0 ? 30 : 0,
                  top: currentIndex == 0 ? 30 : 55,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: currentIndex == 0 ? 1 : 0.5,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Image.asset(images[(currentIndex + 2) % images.length]),
                  ),
                ),
                AnimatedPositioned(
                  height: currentIndex == 1 ? 300 : 200,
                  width: currentIndex == 1 ? 300 : 200,
                  left: currentIndex == 1 ? 30 : 0,
                  top: currentIndex == 1 ? 30 : 55,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: currentIndex == 1 ? 1 : 0.25,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Image.asset(images[(currentIndex + 1) % images.length]),
                  ),
                ),
                AnimatedPositioned(
                  height: currentIndex == 2 ? 300 : 200,
                  width: currentIndex == 2 ? 300 : 200,
                  left: currentIndex == 2 ? 30 : 0,
                  top: currentIndex == 2 ? 30 : 55,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: currentIndex == 2 ? 1 : 0.25,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
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

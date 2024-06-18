import 'package:flutter/material.dart';

class TrialTwo2 extends StatefulWidget {
  const TrialTwo2({super.key});

  @override
  State<TrialTwo2> createState() => _TrialTwo2State();
}

class _TrialTwo2State extends State<TrialTwo2> {
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
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            width: 360,
            height: 300,
            child: Stack(
              children: [
                // Bottommost container
                AnimatedPositioned( // Bottommost Container
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 2 ? 0 : currentIndex == 1 ? 30 : 50,
                  top: currentIndex == 2 ? 55 : currentIndex == 1 ? 30 : 0,
                  height: currentIndex == 2 ? 200 : currentIndex == 1 ? 250 : 300,
                  width: currentIndex == 2 ? 200 : currentIndex == 1 ? 250 : 300,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 2 ? 0.25 : currentIndex == 1 ? 0.5 : 1,
                    child: Image.asset(images[(currentIndex + 2) % images.length]),
                  ),
                ),
                // Middle container
                AnimatedPositioned( // Middle Container
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 1 ? 30 : currentIndex == 0 ? 50 : 0,
                  top: currentIndex == 1 ? 30 : currentIndex == 0 ? 0 : 55,
                  height: currentIndex == 1 ? 250 : currentIndex == 0 ? 300 : 200,
                  width: currentIndex == 1 ? 250 : currentIndex == 0 ? 300 : 200,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 1 ? 0.5 : currentIndex == 0 ? 1 : 0.25,
                    child: Image.asset(images[(currentIndex + 1) % images.length]),
                  ),
                ),
                // Topmost container
                AnimatedPositioned( // Uppermost Container
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: currentIndex == 0 ? 50 : currentIndex == 2 ? 0 : 30,
                  top: currentIndex == 0 ? 0 : currentIndex == 2 ? 55 : 30,
                  height: currentIndex == 0 ? 300 : currentIndex == 2 ? 200 : 250,
                  width: currentIndex == 0 ? 300 : currentIndex == 2 ? 200 : 250,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    opacity: currentIndex == 0 ? 1 : currentIndex == 2 ? 0.25 : 0.5,
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

import 'package:flutter/material.dart';

class Animma extends StatefulWidget {
  const Animma({super.key});

  @override
  State<Animma> createState() => _AnimmaState();
}

class _AnimmaState extends State<Animma> {
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
              border: Border.all(color: Colors.grey),
            ),
            width: 360,
            height: 300,
            child: Stack(
              children: [
                // First and Last Images (Static Positioning)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(images[currentIndex]),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(images[(currentIndex + 2) % images.length]),
                ),
                // Animated Middle Image
                AnimatedPositioned(
                  height: 300,
                  width: 300,
                  top: (300 - 200) / 2, // Center the image vertically
                  left: (360 - 300) / 2, // Center the image horizontally
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: 1, // Always fully opaque
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Image.asset(images[(currentIndex + 1) % images.length]),
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

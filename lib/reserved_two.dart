import 'package:flutter/material.dart';

class TrialTwo3 extends StatefulWidget {
  const TrialTwo3({super.key});

  @override
  State<TrialTwo3> createState() => _TrialTwo3State();
}

class _TrialTwo3State extends State<TrialTwo3> {
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
                for (int i = 0; i < images.length; i++)
                  AnimatedPositioned(
                    height: currentIndex == i ? 300 : 200,
                    width: currentIndex == i ? 300 : 200,
                    left: currentIndex == i ? 30 : 0,
                    top: currentIndex == i ? 30 : 55,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      opacity: currentIndex == i ? 1 : 0.25,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: Image.asset(images[(currentIndex + i) % images.length]),
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

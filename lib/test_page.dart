import 'package:five_apps/Carousel.dart';
import 'package:five_apps/FetchData.dart';
import 'package:flutter/material.dart';
import 'package:five_apps/LogoExpandAnim.dart';
import 'package:five_apps/learn_flutter_page.dart';
import 'MagicalWorld.dart';
import 'package:five_apps/quiz.dart';
import 'package:five_apps/CardSwipe.dart';


class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const LogoExpandAnim();
                  },
                ),
              );
            },
            child: const Text('Logo Expand Animation'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const LearnFlutterPage();
                }),
              );
            },
            child: const Text('Navigation and UI Practise'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return CarouselDemo();
                }),
              );
            },
            child: const Text('Carousel Images'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const FetchData();
                  },
                ),
              );
            },
            child: const Text('Fetch Data'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const MagicalWorld();
                }),
              );
            },
            child: const Text('A Magical World'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const Quiz();
                }),
              );
            },
            child: const Text('Quiz time!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const CardSwipe();
                }),
              );
            },
            child: const Text('CardSwipe'),
          ),
        ],
      ),
    );
  }
}

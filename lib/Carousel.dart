// ignore: file_names
import 'dart:ui';
import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget {
  CarouselDemo({super.key});
  static String routeName = '/misc/carousel';

  static const List<String> fileNames = [
    'green_hell.jpeg',
    'boomerang_fu.jpeg',
    'scarlet_violet.jpeg',
  ];

  final List<Widget> images =
      fileNames.map((file) => Image.asset(file, fit: BoxFit.cover)).toList();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Carousel(itemBuilder: widgetBuilder),
          ),
        ),
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index) {
    return images[index % images.length];
  }
}

typedef OnCurrentItemChangedCallback = void Function(int currentItem);

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({super.key, required this.itemBuilder});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _controller;
  late int _currentPage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = PageController(
      viewportFraction: .85,
      initialPage: _currentPage,
    );
  }

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(

      onPageChanged: (value) {
        setState(() {
          _pageHasChanged = true;
          _currentPage = value;
        });
      },
      controller: _controller,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          var result = _pageHasChanged ? _controller.page! : _currentPage * 1.0;

          // The horizontal position of the page between a 1 and 0
          var value = result - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);

          return SingleChildScrollView(
            child: Column(
              children: [
              SizedBox(
              height: Curves.easeOut.transform(value) * size.height,
              width: Curves.easeOut.transform(value) * size.width,
              child: child,
            ),
            const Center(
              child: Text("fun images"),
            )
           ] ),

          );
        },
        child: widget.itemBuilder(context, index),

      ),
    
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
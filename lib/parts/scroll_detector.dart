import 'package:flutter/material.dart';

class ScrollDetector extends StatefulWidget {
  final Widget Function(BuildContext, ScrollController) builder;
  final VoidCallback loadNext;
  final double threshold;

  const ScrollDetector({
    Key? key,
    required this.builder,
    required this.loadNext,
    required this.threshold,
  }) : super(key: key);

  @override
  ScrollDetectorState createState() => ScrollDetectorState();
}

class ScrollDetectorState extends State<ScrollDetector> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        double scrollValue =
            _controller.offset / _controller.position.maxScrollExtent;
        if (scrollValue > widget.threshold) {
          widget.loadNext();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

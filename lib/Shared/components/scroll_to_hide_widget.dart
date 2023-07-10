// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class scrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const scrollToHideWidget(
      {Key? key,
      required this.controller,
      required this.child,
      this.duration = const Duration(milliseconds: 200)})
      : super(key: key);

  @override
  State<scrollToHideWidget> createState() => _scrollToHideWidgetState();
}

class _scrollToHideWidgetState extends State<scrollToHideWidget> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(lister);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(lister);
  }

  void lister() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (!isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 56 : 0,
      child: Wrap(
        children: [
          widget.child,
        ],
      ),
    );
  }
}

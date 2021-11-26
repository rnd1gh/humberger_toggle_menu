import 'dart:math';

import 'package:flutter/material.dart';

class HumbergerToggleMenu extends StatefulWidget {
  final double height;
  final VoidCallback onPress;
  final bool isSelected;
  final Color activeColor;
  final Color deactiveColor;

  const HumbergerToggleMenu({
    Key? key,
    this.height = 100,
    required this.onPress,
    required this.isSelected, // this param should be required
    this.activeColor = Colors.redAccent,
    this.deactiveColor = Colors.blue,
  }) : super(key: key);

  @override
  State<HumbergerToggleMenu> createState() => _HumbergerToggleMenuState();
}

class _HumbergerToggleMenuState extends State<HumbergerToggleMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // function helper conver degrees to radians
  double degrees2Radians = pi / 180.0;
  double radians(double degrees) => degrees * degrees2Radians;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            if (widget.isSelected) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }

            return Container(
              height: widget.height,
              width: widget.height,
              color:
                  widget.isSelected ? widget.activeColor : widget.deactiveColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 1. translate to old position Offset(0,0)
                  // 2. rotate to 45 degrees
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateZ(
                        radians(45 * _animationController.value),
                      ),
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        -(widget.height / 4) +
                            (widget.height / 4) * _animationController.value,
                      ),
                      child: Container(
                        width: widget.height * 0.7,
                        height: widget.height * 0.08,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateZ(radians(45 * _animationController.value)),
                    child: Container(
                      width: widget.height * 0.7,
                      height: widget.height * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  // 1. translate to old position Offset(0,0)
                  // 2. rotate to -45 degrees
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateZ(
                        radians(
                          -45 * _animationController.value,
                        ),
                      ),
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        widget.height / 4 -
                            (widget.height / 4) * _animationController.value,
                      ),
                      child: Container(
                        width: widget.height * 0.7,
                        height: widget.height * 0.08,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

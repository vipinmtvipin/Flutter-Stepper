import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sample_flutterapp/custome_stepper/flutter_vip_stepper.dart';

class StepperDotProvider extends StatelessWidget {
  final StepperData item;
  final int index;
  final int activeIndex;
  final double? iconHeight;
  final double? iconWidth;
  final Color? activeColor;
  final Color? inActiveColor;
  final bool stepDotWithNoContent;
  final bool isFilledInActiveDot;

  const StepperDotProvider(
      {Key? key,
      required this.index,
      required this.activeIndex,
      required this.stepDotWithNoContent,
      required this.isFilledInActiveDot,
      required this.item,
      this.iconHeight,
      this.iconWidth,
      this.activeColor,
      this.inActiveColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconHeight,
      width: iconWidth,
      child: item.showProgressIndicator == true
          ? StepperProgressDot(
              index: index,
              progressPercentage: item.progressPercentage,
              activeIndex: activeIndex,
              child: StepperDot(
                index: index,
                activeIndex: activeIndex,
                activeColor: activeColor,
                inActiveColor: inActiveColor,
                stepDotWithNoContent: stepDotWithNoContent,
                isFilledInActiveDot: isFilledInActiveDot,
                child: item.iconWidget,
              ),
            )
          : StepperDot(
              index: index,
              activeIndex: activeIndex,
              activeColor: activeColor,
              inActiveColor: inActiveColor,
              stepDotWithNoContent: stepDotWithNoContent,
              isFilledInActiveDot: isFilledInActiveDot,
              child: item.iconWidget,
            ),
    );
  }
}

class StepperProgressDot extends StatelessWidget {
  final Widget child;
  final int index;
  final int activeIndex;
  final double? progressPercentage;

  const StepperProgressDot({
    Key? key,
    required this.index,
    required this.activeIndex,
    required this.child,
    this.progressPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: CustomPaint(
        painter: CircularProgressPainter(progressPercentage ?? 50),
        child: child,
      ),
    );
  }
}

class StepperDot extends StatelessWidget {
  final int index;
  final int activeIndex;
  final Color? activeColor;
  final Color? inActiveColor;
  final bool stepDotWithNoContent;
  final bool? isFilledInActiveDot;
  final Widget? child;
  const StepperDot({
    Key? key,
    required this.index,
    required this.activeIndex,
    required this.stepDotWithNoContent,
    required this.isFilledInActiveDot,
    this.activeColor,
    this.inActiveColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = (index <= activeIndex)
        ? activeColor ?? Colors.blue
        : inActiveColor ?? Colors.grey;

    return Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: (isFilledInActiveDot == true && index <= activeIndex)
              ? color
              : isFilledInActiveDot == false
                  ? color
                  : Colors.transparent,
          border: Border.all(
            color: color,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: stepDotWithNoContent == true
            ? const SizedBox.shrink()
            : (child ??
                Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: isFilledInActiveDot == true
                      ? const TextStyle(color: Colors.black, fontSize: 10)
                      : const TextStyle(color: Colors.white, fontSize: 10),
                )));
  }
}

class CircularProgressPainter extends CustomPainter {
  final double percentage;
  CircularProgressPainter(this.percentage);
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final progressPaint = Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc (only the portion representing the percentage)
    final sweepAngle = (math.pi * percentage) / 50;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

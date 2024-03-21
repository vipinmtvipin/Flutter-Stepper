import 'package:flutter/material.dart';
import 'package:sample_flutterapp/custome_stepper/widgets/horizontal_stepper.dart';
import 'package:sample_flutterapp/custome_stepper/widgets/vertical_stepper.dart';

class FlutterVipStepper extends StatelessWidget {
  final List<StepperData> stepperList;
  final double verticalGap;
  final int activeIndex;
  final Axis stepperDirection;
  final bool inverted;
  final Color activeColor;
  final Color inActiveColor;
  final double barThickness;
  final double iconHeight;
  final double iconWidth;
  final bool? stepDotWithNoContent;
  final bool? isFilledInActiveDot;
  final ScrollPhysics? scrollPhysics;
  const FlutterVipStepper({
    Key? key,
    required this.stepperList,
    this.verticalGap = 30,
    this.activeIndex = 0,
    required this.stepperDirection,
    this.inverted = false,
    this.activeColor = Colors.blue,
    this.inActiveColor = Colors.grey,
    this.barThickness = 2,
    this.scrollPhysics,
    this.iconHeight = 25,
    this.iconWidth = 25,
    this.stepDotWithNoContent,
    this.isFilledInActiveDot,
  })  : assert(verticalGap >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var crossAxisAlign = stepperDirection == Axis.horizontal
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    if (inverted) {
      // invert Alignment in case of [Axis.vertical]
      crossAxisAlign = crossAxisAlign == CrossAxisAlignment.end
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end;
    }
    final Iterable<int> iterable = Iterable<int>.generate(stepperList.length);
    return Flex(
      crossAxisAlignment: crossAxisAlign,
      direction: stepperDirection,
      children: iterable
          .map((index) => _getPreferredStepper(context, index: index))
          .toList(),
    );
  }

  Widget _getPreferredStepper(BuildContext context, {required int index}) {
    if (stepperDirection == Axis.horizontal) {
      return HorizontalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveColor: inActiveColor,
        activeColor: activeColor,
        barHeight: barThickness,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
        isFilledInActiveDot: isFilledInActiveDot ?? false,
        stepDotWithNoContent: stepDotWithNoContent ?? false,
      );
    } else {
      return VerticalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        gap: verticalGap,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveColor: inActiveColor,
        activeColor: activeColor,
        barWidth: barThickness,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
        isFilledInActiveDot: isFilledInActiveDot ?? false,
        stepDotWithNoContent: stepDotWithNoContent ?? false,
      );
    }
  }
}

class StepperData {
  final StepperText? title;
  final StepperText? subtitle;
  final Widget? iconWidget;
  final bool? showProgressIndicator;
  final double? progressPercentage;
  StepperData({
    this.iconWidget,
    this.title,
    this.subtitle,
    this.showProgressIndicator = false,
    this.progressPercentage = 50,
  });
}

class StepperText {
  final String text;
  final TextStyle? textStyle;
  StepperText(this.text, {this.textStyle});
}
